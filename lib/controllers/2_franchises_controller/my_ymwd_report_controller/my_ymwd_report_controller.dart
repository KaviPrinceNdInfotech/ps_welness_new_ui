import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDDoctorReportApi_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class YmwdController extends GetxController {
  final GlobalKey<FormState> ymwdformkey = GlobalKey<FormState>();

  // var selectedTime = TimeOfDay.now().obs;
  // var selectedTime2 = TimeOfDay.now().obs;
  // var selectedTime3 = TimeOfDay.now().obs;
  // var selectedTime4 = TimeOfDay.now().obs;
  // var selectedDate = DateTime.now().obs;
  // RxInt selectedIndex = 0.obs;
  // var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  // late TextEditingController appointmentController1;
  // late TextEditingController appointmentController2;

  ///TODO: image picker.................
  ///
 // var selectedImagepath = ''.obs;

  // void getImage(ImageSource imageSource) async {
  //   final pickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagepath.value = pickedFile.path;
  //   } else {
  //     print('No image selected');
  //   }
  // }

  ///TODO: image picker.2................
  ///
 // var selectedImagepath1 = ''.obs;

  // void getImage1(ImageSource imageSource) async {
  //   final pickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagepath.value = pickedFile.path;
  //   } else {
  //     print('No image selected');
  //   }
  // }

  ///this is for State....................................
  Rx<String?> selectedTerm = (null as String?).obs;
  RxList<String> termss = <String>[].obs;
  FrenchiesYmdwDoctorModel? getfrenchiesYmdwDoctorModel;
  void frenchiesYMDWDoctorReportApi(String role)async{
    isLoading(true);
    getfrenchiesYmdwDoctorModel = await ApiProvider.FrenchiesYMWDDoctorReportApi(role);
    if(getfrenchiesYmdwDoctorModel?.doctorYmwdReport != null){
      isLoading(false);
      ///for search filter
      data.value = getfrenchiesYmdwDoctorModel!.doctorYmwdReport!;
    }
  }
  /// for search filter
  RxList<DoctorYmwdReport> data = RxList<DoctorYmwdReport>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<DoctorYmwdReport>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesYmdwDoctorModel!.doctorYmwdReport!;
    } else {
      finalResult = getfrenchiesYmdwDoctorModel!.doctorYmwdReport!
          .where((element) => element.doctorName
          .toString()
          .toLowerCase()
          .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }
  @override
  void onInit() {
    super.onInit();
    frenchiesYMDWDoctorReportApi('');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }

  // chooseDate() async {
  //   DateTime? newpickedDate = await showDatePicker(
  //     context: Get.context!,
  //     initialDate: selectedDate.value,
  //     firstDate: DateTime(2018),
  //     lastDate: DateTime(2025),
  //     initialEntryMode: DatePickerEntryMode.input,
  //     initialDatePickerMode: DatePickerMode.year,
  //     helpText: 'Select DOB',
  //     cancelText: 'Close',
  //     confirmText: 'Confirm',
  //     errorFormatText: 'Enter valid date',
  //
  //     errorInvalidText: 'Enter valid date range',
  //     fieldLabelText: 'DOB',
  //   );
  //   if (newpickedDate != null) {
  //     selectedDate.value = newpickedDate;
  //     appointmentController1
  //       ..text = DateFormat.yMMMd().format(selectedDate.value).toString()
  //       ..selection = TextSelection.fromPosition(TextPosition(
  //           offset: appointmentController1.text.length,
  //           affinity: TextAffinity.upstream));
  //   }
  // }
  // chooseDate2() async {
  //   DateTime? newpickedDate = await showDatePicker(
  //     context: Get.context!,
  //     initialDate: selectedDate.value,
  //     firstDate: DateTime(2018),
  //     lastDate: DateTime(2025),
  //     initialEntryMode: DatePickerEntryMode.input,
  //     initialDatePickerMode: DatePickerMode.year,
  //     helpText: 'Select DOB',
  //     cancelText: 'Close',
  //     confirmText: 'Confirm',
  //     errorFormatText: 'Enter valid date',
  //     errorInvalidText: 'Enter valid date range',
  //     fieldLabelText: 'DOB',
  //   );
  //   if (newpickedDate != null) {
  //     selectedDate.value = newpickedDate;
  //     appointmentController2
  //       ..text = DateFormat.yMMMd().format(selectedDate.value).toString()
  //       ..selection = TextSelection.fromPosition(TextPosition(
  //           offset: appointmentController2.text.length,
  //           affinity: TextAffinity.upstream));
  //   }
  // }
  ///time 1........................
  // chooseTime() async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //       context: Get.context!,
  //       initialTime: selectedTime.value,
  //       builder: (context, child) {
  //         return Theme(data: ThemeData.dark(), child: child!);
  //       },
  //       initialEntryMode: TimePickerEntryMode.input,
  //       helpText: 'Select Departure Time',
  //       cancelText: 'Close',
  //       confirmText: 'Confirm',
  //       errorInvalidText: 'Provide valid time',
  //       hourLabelText: 'Select Hour',
  //       minuteLabelText: 'Select Minute');
  //
  //   if (pickedTime != null && pickedTime != selectedTime.value) {
  //     selectedTime.value = pickedTime;
  //   }
  // }

  ///time 2...................

  // chooseTime2() async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //       context: Get.context!,
  //       initialTime: selectedTime2.value,
  //       builder: (context, child) {
  //         return Theme(data: ThemeData.dark(), child: child!);
  //       },
  //       initialEntryMode: TimePickerEntryMode.input,
  //       helpText: 'Select Departure Time',
  //       cancelText: 'Close',
  //       confirmText: 'Confirm',
  //       errorInvalidText: 'Provide valid time',
  //       hourLabelText: 'Select Hour',
  //       minuteLabelText: 'Select Minute');
  //   if (pickedTime != null && pickedTime != selectedTime2.value) {
  //     selectedTime2.value = pickedTime;
  //   }
  // }

  ///time 3........................
  // chooseTime3() async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //       context: Get.context!,
  //       initialTime: selectedTime3.value,
  //       builder: (context, child) {
  //         return Theme(data: ThemeData.dark(), child: child!);
  //       },
  //       initialEntryMode: TimePickerEntryMode.input,
  //       helpText: 'Select Departure Time',
  //       cancelText: 'Close',
  //       confirmText: 'Confirm',
  //       errorInvalidText: 'Provide valid time',
  //       hourLabelText: 'Select Hour',
  //       minuteLabelText: 'Select Minute');
  //
  //   if (pickedTime != null && pickedTime != selectedTime3.value) {
  //     selectedTime3.value = pickedTime;
  //   }
  // }
  // ///time 4...................
  // chooseTime4() async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //       context: Get.context!,
  //       initialTime: selectedTime4.value,
  //       builder: (context, child) {
  //         return Theme(data: ThemeData.dark(), child: child!);
  //       },
  //       initialEntryMode: TimePickerEntryMode.input,
  //       helpText: 'Select Departure Time',
  //       cancelText: 'Close',
  //       confirmText: 'Confirm',
  //       errorInvalidText: 'Provide valid time',
  //       hourLabelText: 'Select Hour',
  //       minuteLabelText: 'Select Minute');
  //   if (pickedTime != null && pickedTime != selectedTime4.value) {
  //     selectedTime4.value = pickedTime;
  //   }
  // }
  // String? validaadhar(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   return null;
  // }
  // String? validAddress(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   return null;
  // }
  // String? validcertificate(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   return null;
  // }
  //
  // String? validcertificatevalidity(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   return null;
  // }
  //
  // void checknurse2() {
  //   final isValid = ymwdformkey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   ymwdformkey.currentState!.save();
  //   //Get.to(() => HomePage());
  // }
}
