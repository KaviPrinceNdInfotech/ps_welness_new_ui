import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import 'package:ps_welness_new_ui/model/1_user_model/get_department_list_model/department_model.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../modules_view/circular_loader/circular_loaders.dart';

class DoctorDoneController extends GetxController {
  //DoctorListController _doctorListController = Get.put(DoctorListController());

  // final GlobalKey<FormState> doctorappointment1key = GlobalKey<FormState>();

  Future<void> doctordoneaptApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.doctorappointmentDoneApi();

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      //Get.to(NurseListUser());

      /// we can navigate to user page.....................................
      // Get.to(LabCatagaryDetails());
      //CallLoader.loader();
      //await Future.delayed(Duration(seconds: 1));
      //CallLoader.hideLoader();
      // await Get.offAll(DoctorHomePage());
    }
  }

  @override
  void onInit() {
    //states.refresh();
    super.onInit();

    //getDepartmentNameApi();
  }
  // nameController = TextEditingController();
  // emailController = TextEditingController();
  // passwordController = TextEditingController();
  // confirmpasswordController = TextEditingController();
  // mobileController = TextEditingController();
  // addressController = TextEditingController();
  // pinController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  //
  // void doctorcheck1() {
  //   if (doctorappointment1key.currentState!.validate()) {
  //     doctorbooking1Api();
  //   }
  //   doctorappointment1key.currentState!.save();
  // }
}
