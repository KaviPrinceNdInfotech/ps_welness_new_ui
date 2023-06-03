// import 'package:get/get.dart';
//
// import '../../model/4_nurse_all_models_RRR/nurse_appointment_history_model.dart';
// import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
// //import 'package:ps_welness_new_ui/model/4_nurse_all_models/nurse_appointment_history_model.dart';
// //import '../../servicess_api/api_services_all_api.dart';
//
// class NurseAppointmentHistoryController extends GetxController {
//   RxBool isLoading = true.obs;
//   List<NurseAppointmentHistoryModel>? getNurseAppointmentHistory;
//
//   void nurseAppointmentHistoryApi() async {
//     isLoading(true);
//     getNurseAppointmentHistory = await ApiProvider.NurseAppointmentHistoryApi();
//     if (getNurseAppointmentHistory != null) {
//       isLoading(false);
//       foundappointment.value = getNurseAppointmentHistory!;
//     }
//   }
//
//   @override
//   void onInit() {
//     nurseAppointmentHistoryApi();
//     super.onInit();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   RxList<NurseAppointmentHistoryModel> foundappointment =
//       RxList<NurseAppointmentHistoryModel>([]);
//
//   void filterAppointmentNurse(String searchappointmentssNurse) {
//     List<NurseAppointmentHistoryModel>? finalResult = [];
//     if (searchappointmentssNurse.isEmpty) {
//       finalResult = getNurseAppointmentHistory;
//     } else {
//       finalResult = getNurseAppointmentHistory!
//           .where((element) => element.patientName
//               .toString()
//               .toLowerCase()
//               .contains(
//                   searchappointmentssNurse.toString().toLowerCase().trim()))
//           .toList();
//     }
//     print(finalResult?.length);
//     foundappointment.value = finalResult!;
//   }
// }
