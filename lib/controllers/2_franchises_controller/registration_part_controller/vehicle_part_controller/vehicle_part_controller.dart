import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleCategoryDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleTypeDD_model.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class Franchies_vehicle_Controller extends GetxController {
  final GlobalKey<FormState> frvehicleformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  TextEditingController? panController,
      nameController,
      vehiclenumberController,
      accountController,
      confirmaccountController,
      driverchargeController,
      accountholderController,
      IfscController,
      vendorIdController;

  var pan = '';
  var name = '';
  var vehiclenumber = '';
  var account = '';
  var confirmaccount = '';
  var drivercharge = '';
  var acholdername = '';
  var ifsccode = '';
  var selectedImagepath = ''.obs;

  ///

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  Rx<VehicleTypeName?> selectedVehicleType = (null as VehicleTypeName?).obs;
  RxList<VehicleTypeName> vehicleType = <VehicleTypeName>[].obs;
  Rx<VehicleCatDropdown?> selectedVehicleCat =
      (null as VehicleCatDropdown?).obs;
  List<VehicleCatDropdown> vehicles = <VehicleCatDropdown>[].obs;

  void getVehicleCategoryApi() async {
    vehicles = await ApiProvider.getVehicleCategoryApi();
  }

  void getVehicleByCategoryID(String stateID) async {
    vehicleType.clear();
    final localList = await ApiProvider.getVehicleTypeApi(stateID);
    vehicleType.addAll(localList);
  }

  void FrenchiesVehicleRegistration() async {
    isLoading(true);
    // final imageAsBase64 =
    //     base64Encode(await File(selectedImagepath.value).readAsBytes());
    http.Response r = await ApiProvider.FrenchiesRegisterVehicle(
      panController?.text,
      nameController?.text,
      vehiclenumberController?.text,
      accountController?.text,
      driverchargeController?.text,
      accountholderController?.text,
      selectedVehicleCat.value?.id.toString(),
      selectedVehicleType.value?.id.toString(),
      IfscController?.text,

      /// selectedImagepath.value.split('/').last,
      ///imageAsBase64
    );
    if (r.statusCode == 200) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getVehicleCategoryApi();
    selectedVehicleCat.listen((p0) {
      if (p0 != null) {
        getVehicleByCategoryID("${p0.id}");
      }
    });
    panController = TextEditingController();
    nameController = TextEditingController();
    vehiclenumberController = TextEditingController();
    accountController = TextEditingController();
    driverchargeController = TextEditingController();
    accountholderController = TextEditingController();
    IfscController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // nameController?.dispose();
    // vehiclenumberController?.dispose();
    // accountController?.dispose();
    // confirmaccountController?.dispose();
    // driverchargeController?.dispose();
    // accountholderController?.dispose();
    // IfscController?.dispose();
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide Vehicle name";
    }
    return null;
  }

  String? validnumber(String value) {
    if (value.isEmpty) {
      return '              Enter Vehicle Number';
    }
    return null;
  }

  String? validAcno(String value) {
    account = value;
    if (value.isEmpty) {
      return "              Please Enter account no";
    } else if (value.length < 8) {
      return "              A/c no must be atleast 8 characters long";
    } else {
      return null;
    }
  }

  String? validConfirmAcno(String value) {
    if (value.isEmpty) {
      return "              Please Re-Enter account no";
    } else if (value.length < 8) {
      return "              A/c no must be atleast 8 characters long";
    } else if (value != account) {
      return "              A/C no must be same as above";
    } else {
      return null;
    }
  }

  String? validcharge(String value) {
    if (value.isEmpty) {
      return '              Enter Your charge for per Km';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? validaccholder(String value) {
    if (value.length < 2) {
      return "              Enter Account holder Name";
    }
    return null;
  }

  String? validIfsc(String value) {
    if (value.isEmpty) {
      return '              Provide IFSC Code';
    }
    // if (value.length != 6) {
    //   return '              A valid ifsc should be of 6 digits';
    // }
    return null;
  }

  String? validPan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid pan number should be of 10 digits';
    }
    return null;
  }

  Future<void> checkFrvehicle() async {
    final isValid = frvehicleformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    // else if (selectedImagepath.value == '') {
    //   Get.snackbar("title", "please select photo");
    // }
    else {
      FrenchiesVehicleRegistration();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      Get.offAll(FranchiesHomePage());
    }
    frvehicleformkey.currentState!.save();
  }
}
