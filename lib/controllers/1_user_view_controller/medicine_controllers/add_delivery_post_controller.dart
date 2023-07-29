import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/utils/services/account_service.dart';

import '../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../model/1_user_model/states_model/state_modells.dart';
import '../../../modules_view/1_user_section_views/medicine_view/medicine_address_list/medicine_address_list_view.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';
import 'medicine_address_controller/medicine_address_controller.dart';

class MedicineAddressController extends GetxController {
  final GlobalKey<FormState> medicineaddressformmkey = GlobalKey<FormState>();

  medicine_addresssList_Controller _medicine_addresslist_controller =
      Get.put(medicine_addresssList_Controller());

  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;

  ///
  List<StateModel> states = <StateModel>[];

  //get context => null;

  ///

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
    print("Prince cities of $stateID");
    print(cities);
  }

  void addmedicineaddressApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.deliverymedicineAddressApi(
      nameController.text,
      emailController.text,
      mobileController.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      deliveryaddressController.text,
      pinController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      Get.snackbar("Add Sucessfully", "${r.body}");

      CallLoader.hideLoader();
      _medicine_addresslist_controller.onInit();
      _medicine_addresslist_controller.medicineaddressListApi();
      // Get.to(
      //   () => Medicineaddresslist(), //next page class
      //   duration: Duration(seconds: 0), //duration of transitions, default 1 sec
      //   transition:
      //       // Transition.leftToRight //transition effect
      //       // Transition.fadeIn
      //       //Transition.size
      //       Transition.zoom,
      // );
      accountService.getAccountData.then((accountData) {
        Timer(
          Duration(seconds: 2),
          //transition:Transition.zoom,

          () async {
            await Get.to(() => Medicineaddresslist());

            // await Get.offAll(() => Medicineaddresslist());

            //Get.to((page))
            ///
          },
        );
      });

      /// we can navigate to user page.....................................
      //Get.to(Medicineaddresslist());
    }
  }

  late TextEditingController nameController,
      emailController,
      // confirmpasswordController,
      mobileController,
      passwordController,
      StateController,
      CityController,
      deliveryaddressController,
      pinController;

  var name = '';
  var email = '';
  var mobile = '';
  var state = '';
  var city = '';
  var address = '';
  var pin = '';

  @override
  void onInit() {
    //states.refresh();
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();
    // passwordController = TextEditingController();
    StateController = TextEditingController();
    CityController = TextEditingController();
    deliveryaddressController = TextEditingController();
    pinController = TextEditingController();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    //passwordController.dispose();
    StateController.dispose();
    CityController.dispose();
    deliveryaddressController.dispose();
    pinController.dispose();
  }

  ///delete your controller...
  @override
  void dispose() {
    Get.delete<MedicineAddressController>();
    super.dispose();
  }

  //Get.delete<YourController>();

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }

  String? validEmail(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (!value.contains('@')) {
      return "              A valid email should contain '@'";
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return "              Please enter a valid email";
    }
    return null;
  }

  String? validPassword(String value) {
    // confirmpassword = value;

    if (value.isEmpty) {
      return "              Please Enter New Password";
    } else if (value.length < 5) {
      return "              Password must be atleast 5 characters long";
    } else {
      return null;
    }
  }

  // String? validConfirmPassword(String value) {
  //   if (value.isEmpty) {
  //     return "              Please Re-Enter New Password";
  //   } else if (value.length < 8) {
  //     return "              Password must be atleast 8 characters long";
  //   } else if (value != confirmpassword) {
  //     return "              Password must be same as above";
  //   } else {
  //     return null;
  //   }
  // }

  String? validPhone(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid phone number should be of 10 digits';
    }
    return null;
  }

  String? validState(String value) {
    if (value.length < 2) {
      return "              Provide valid address";
    }
    return null;
  }

  String? validCity(String value) {
    if (value.length < 2) {
      return "              Provide valid address";
    }
    return null;
  }

  String? validAddress(String value) {
    if (value.length < 2) {
      return "              Provide valid address";
    }
    return null;
  }

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 6) {
      return '              A valid pin should be of 6 digits';
    }
    return null;
  }

  void checkaddressmedicine() {
    if (medicineaddressformmkey.currentState!.validate()) {
      addmedicineaddressApi();
    }
    medicineaddressformmkey.currentState!.save();
  }

// void checkUser1() {
//   final isValid = user1formkey.currentState!.validate();
//   if (!isValid) {
//     return;
//   }
//   user1formkey.currentState!.save();
//   //Get.to(() => HomePage());
// }

}
