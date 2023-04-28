import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/1_user_model/lab_list_models.dart';
import '../../../model/9_doctors_model/get_doctor_list_model/get_doctorlist_model.dart';
import '../../../modules_view/1_user_section_views/doctorss/doctor_appointments_details/doctor_details_by_id/doctor_detail_by_id_model.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/lab_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class DoctorListController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = true.obs;

  late TextEditingController appointmentController;
  var appointment = ''.obs;



  GetDoctorListModel? doctorListUser;
  @override

  void onInit() {
    super.onInit();
    doctorListApi();
    doctordetailApi();
    appointmentController = TextEditingController();
    appointmentController.text = "DD-MM-YYYY";
  }

  void doctorListApi() async {
    isLoading(true);
    doctorListUser = await ApiProvider.ViewDoctorListApi();
    print('Prince doctor list');
    print(doctorListUser);
    if (doctorListUser != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundDoctors.value = doctorListUser!.doctorchoose!;
      //Get.to(()=>Container());
    }
  }

  ///get specialist api...........17 april 2023...prince
  GetDoctorDetailbyId? doctordetailbyid;
  void doctordetailApi() async {
    isLoading(true);
    doctordetailbyid = await ApiProvider.ViewDoctorDetailApi();
    print('Prince doctor list detail by id');
    print(doctordetailbyid);
    if (doctordetailbyid != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }



  @override
  void onClose() {
    doctorListUser = null;
    super.onClose();
  }

  @override
  void dispose() {
    doctorListUser = null;
    super.dispose();
  }

  chooseDate() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      appointmentController
        ..text = DateFormat.yMMMd().format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: appointmentController.text.length,
            affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }
  
  RxList<Doctorchoose> foundDoctors = RxList<Doctorchoose>([]);
  void filterDoctor (String searchdoctorName) {
    List<Doctorchoose>? finalResult = [];
    if (searchdoctorName.isEmpty) {
      finalResult = doctorListUser!.doctorchoose;
    } else {
      finalResult = doctorListUser!.doctorchoose!.where((element) => element.doctorName
          .toString().toLowerCase().contains(searchdoctorName.toString().toLowerCase().trim())
      ).toList();
    }
    print(finalResult?.length);
    foundDoctors.value = finalResult!;
  }
}

///todo from here checkout model value..............
