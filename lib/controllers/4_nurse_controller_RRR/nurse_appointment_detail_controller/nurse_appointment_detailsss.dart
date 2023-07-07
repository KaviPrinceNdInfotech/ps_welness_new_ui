import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_detail_id.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_list_modelby_locationid.dart';
import 'package:ps_welness_new_ui/model/1_user_model/time_slots_common_model/time_slots_common.dart';
//import 'package:ps_welness_new_ui/modules_view/1_user_section_views/doctorss/appointment_checkout/appointment_checkout.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/nursess/appointment_checkout/appointment_checkout.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../model/4_nurse_all_models_RRR/nurse_appointment_details_list.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
//import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
import '../../../servicess_api/api_services_all_api.dart';
import '../../../utils/services/account_service.dart';

class NurseAppointmentDetailController extends GetxController {
  final GlobalKey<FormState> NurseBooking2formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  RxInt selectedimg = 0.obs;
  RxInt selectedprice = 0.obs;
  //RxBool isLoading = true.obs;
  RxBool rating1 = true.obs;
  RxBool rating2 = false.obs;
  RxBool rating3 = false.obs;
  RxBool rating4 = false.obs;
  RxBool rating5 = false.obs;

  var ratings = 0.0.obs;

  // NurseRatingView? nurseviewreview;
  //var selectedPath = ''.obs;

  ///view review ratting controller.....

  // void nursereviewratingApi() async {
  //   isLoading(true);
  //   nurseviewreview = await ApiProvider.ViewnursereviiewApi();
  //   if (nurseviewreview?.rating != null
  //   //appointmentdetail != null
  //   //getcatagartlist!.result!.isNotEmpty
  //   ) {
  //     isLoading(false);
  //     // foundlabviewProducts.value = labviewreport!.labViewReport!;
  //   }
  // }

  addReview() {
    Get.dialog(
      RatingDialog(
          title: Text("data"),
          starColor: Colors.amber,
          submitButtonText: "Post Review",
          onSubmitted: (response) {
            print(ratings.value);
          }),
    );
  }

  TextEditingController Name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController Description = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController imagePath = TextEditingController();
  TextEditingController imagebase = TextEditingController();

  ///this is the product detail controller.....product Id.........................
  String pro_Id = '';

  GlobalKey<FormState> reviewKey = GlobalKey<FormState>();

  // var selectedPath = ''.obs;

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  //
  // late TextEditingController appointmentController;

  var appointment = ''.obs;

  Rx<TimeSlot?> selectedTimeslot = (null as TimeSlot?).obs;
  List<TimeSlot> timeslot = <TimeSlot>[].obs;

  NurseAppointmentDetail? nurseappointmentdetail;

  NurseListbycityId? nurseListbycityId;

  NursedetailbyId? nursedetailbyId;

  ///nurse type api class.................
  void timeslotApi() async {
    timeslot = (await ApiProvider.gettimeslotApi())!;
    print('Prince time slot  list');
    print(timeslot);
  }

  //all catagary list .........

  // void nurseappointmentApi() async {
  //   isLoading(true);
  //   nurseappointmentdetail = await ApiProvider.NurseappointmentApi();
  //   if (
  //       //nurseappointmentdetail?.result != null
  //       nurseappointmentdetail != null
  //       //getcatagartlist!.result!.isNotEmpty
  //       ) {
  //     isLoading(false);
  //   }
  // }

  ///todo: nurse schedule api by the help of list Id of nurse....
  void nurseBooking2Api() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.Nursesebooking2Api(
      nurseidController.text,
      appointmentController.text,
      selectedTimeslot.value?.slotid.toString(),
      //selectedState.value?.id.toString(),
      // selectedCity.value?.id.toString(),
    );
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      //Get.to(NurseListUser());
      // Get.to(NurseDetailsSchedulePage());
      Get.to(() => AppointmentCheckout());

      /// we can navigate to user page.....................................
      //Get.to(NurseAppointmentHistory());

    }
  }

  late TextEditingController appointmentController, nurseidController;
  //selectedNurse.value?.id.toString(),
  //appointmentController;

  ///todo from here we have get nurse list by location id...
  void nurselistsApi() async {
    isLoading(true);
    nurseListbycityId = await ApiProvider.NursListApi();
    print('Prince doctor list');
    print(nurseListbycityId);
    if (
        //nurseappointmentdetail?.result != null
        nurseListbycityId != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      foundNurses.value = nurseListbycityId!.getNurse!;
    }
  }

  ///todo: from here nurse detail.............18 april 2023...

  void nursedetailApi() async {
    isLoading(true);
    nursedetailbyId = await ApiProvider.NursDetailApi();
    print('Prince nurse detail..');
    print(nursedetailbyId);
    if (nursedetailbyId != null
        //nurseappointmentdetail?.result != null
        //nursedetailbyId != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      //foundNurses.value = nurseappointmentdetail!.result!;

    }
  }

  var selectedPath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFiles = await ImagePicker().pickImage(source: imageSource);
    if (pickedFiles != null) {
      selectedPath.value = pickedFiles.path;
      print("File Path ${pickedFiles.path}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  @override
  void onInit() {
    super.onInit();
    //nurseappointmentApi();
    nurselistsApi();
    nursedetailApi();
    timeslotApi();

    accountService.getAccountData.then((accountData) {
      Timer(
        const Duration(seconds: 4),
        () {
          //Get.to((page))
          ///
        },
      );
    });

    nurseidController = TextEditingController();
    appointmentController = TextEditingController();
    appointmentController.text = "YYY-MM-DD";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TextEditingController.dispose();
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
        ..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
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

  RxList<GetNurse> foundNurses = RxList<GetNurse>([]);
  void filterNurse(String searchnursepatientName) {
    List<GetNurse>? finalResult = [];
    if (searchnursepatientName.isEmpty) {
      finalResult = nurseListbycityId!.getNurse;
    } else {
      finalResult = nurseListbycityId!.getNurse!
          .where((element) => element.nurseName
              .toString()
              .toLowerCase()
              .contains(searchnursepatientName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundNurses.value = finalResult!;
  }

  ///.......................
  void checkNurse2() {
    if (NurseBooking2formkey.currentState!.validate()) {
      //nurseBookingFormApi();
      nurseBooking2Api();
    }
    NurseBooking2formkey.currentState!.save();
  }
}
