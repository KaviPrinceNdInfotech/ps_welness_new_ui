import 'package:get/get.dart';

//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

import '../../model/9_doctors_model/patient_list.dart';
import '../../servicess_api/api_services_all_api.dart';

class PatientListController extends GetxController {
  RxBool isLoading = true.obs;

  DoctorBookingHistoryModel? bookinghistory;

  Future<void> patientListApi() async {
    isLoading(false);
    bookinghistory = await ApiProvider.ViewPatientsListApi();
    print(bookinghistory);
    if (bookinghistory?.bookingHistory != null) {
      isLoading(false);
      founlistpatientappointment.value = bookinghistory!.bookingHistory!;
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    patientListApi();
  }

  @override
  void onClose() {
    bookinghistory = null;
    super.onClose();
  }

  @override
  void dispose() {
    bookinghistory = null;
    super.dispose();
  }

  RxList<BookingHistory> founlistpatientappointment =
      RxList<BookingHistory>([]);
  void filterappointmentt(String searclistpatientName) {
    List<BookingHistory>? finalResult = [];
    if (searclistpatientName.isEmpty) {
      finalResult = bookinghistory!.bookingHistory!;
    } else {
      finalResult = bookinghistory!.bookingHistory!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searclistpatientName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    founlistpatientappointment.value = finalResult!;
  }
}

///todo from here checkout model value..............
