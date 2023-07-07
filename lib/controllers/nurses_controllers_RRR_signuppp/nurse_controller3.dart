// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:ps_welness_new_ui/model/1_user_model/nurse_type_model/nurse_type_model.dart';
// import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
//
// class Nurses_3_controller extends GetxController {
//   final GlobalKey<FormState> nursesformkey3 = GlobalKey<FormState>();
//   ////// drop down nurse type
//   Rx<NurseModels?> selectedNurse = (null as NurseModels?).obs;
//   List<NurseModels> nurse = <NurseModels>[].obs;
//   void getNurseTypeApi() async {
//     nurse = await ApiProvider.getnursetypeApi();
//   }
//
//    TextEditingController?
//        NurseType_IdController,
//        CertificateNumberController,
//        CityNameController,
//        PinCodeController,
//        NurseNameController,
//        PhoneNumberController,
//        MobileNumberController,
//        EmailIdController,
//        StateMaster_IdController,
//        CityMaster_IdController,
//        LocationController,
//        FeeController,
//        PasswordController,
//        ConfirmPasswordController,
//        PanImageFileController,
//        LicenceImageController,
//        CertificateBase64ImageController,
//        CertificateImageNameController,
//        VerificationDocController,
//        CertificateImageController;
//
//   void nurseSignupApi() async {
//     http.Response r = await ApiProvider.NurseSignupApi(
//         NurseType_IdController?.text,
//         CertificateNumberController?.text,
//         CityNameController?.text,
//         PinCodeController?.text,
//         NurseNameController?.text,
//         PhoneNumberController?.text,
//         MobileNumberController?.text,
//         EmailIdController?.text,
//         StateMaster_IdController?.text,
//         CityMaster_IdController?.text,
//         LocationController?.text,
//         FeeController?.text,
//         PasswordController?.text,
//         ConfirmPasswordController?.text,
//         PanImageFileController?.text,
//         LicenceImageController?.text,
//         CertificateBase64ImageController?.text,
//         CertificateImageNameController?.text,
//         VerificationDocController?.text,
//         CertificateImageController?.text
//         );
//     if (r.statusCode == 200) {
//     }else{
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     getNurseTypeApi();
//     NurseType_IdController = TextEditingController(text: '1');
//     CertificateNumberController = TextEditingController(text: '');
//     CityNameController = TextEditingController(text: 'noida');
//     PinCodeController = TextEditingController(text: '201301');
//     NurseNameController = TextEditingController(text: 'a');
//     PhoneNumberController = TextEditingController(text: '9867661112');
//     MobileNumberController = TextEditingController(text: '9866690112');
//     EmailIdController = TextEditingController(text: 'agb@gmail.com');
//     StateMaster_IdController = TextEditingController(text: '2');
//     CityMaster_IdController = TextEditingController(text: '4');
//     LocationController = TextEditingController(text: 'noida');
//     FeeController = TextEditingController(text: '1500');
//     PasswordController = TextEditingController(text: '12345');
//     ConfirmPasswordController = TextEditingController(text: '12345');
//     PanImageFileController = TextEditingController(text: 'flowers.jpg');
//     LicenceImageController = TextEditingController(text: 'flowers.jpg');
//     CertificateBase64ImageController = TextEditingController();
//     CertificateImageNameController = TextEditingController(text: 'dr1.jpg');
//     VerificationDocController = TextEditingController(text: '6985');
//     CertificateImageController = TextEditingController(text: 'dr1.jpg');
//   }
//   @override
//   void onReady() {
//     super.onReady();
//   }
//   @override
//   void onClose() {
//   }
//   String? validLocation(String value) {
//     if (value.length < 2) {
//       return "              Provide valid location";
//     }
//     return null;
//   }
//   String? validDay(String value) {
//     if (value.isEmpty) {
//       return '              This field is required';
//     }
//     return null;
//   }
//   void checkNurses3() {
//     nurseSignupApi();
//     // final isValid = nursesformkey3.currentState!.validate();
//     // if (!isValid) {
//     //   return;
//     // }
//     // nursesformkey3.currentState!.save();
//   }
// }
