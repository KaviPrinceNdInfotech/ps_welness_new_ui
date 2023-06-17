import 'package:get/get.dart';

//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

import '../../model/9_doctors_model/patient_list.dart';
import '../../servicess_api/api_services_all_api.dart';

class PatientListController extends GetxController {
  RxBool isLoading = true.obs;

  PatientList? patientList;

  void patientListApi() async {
    isLoading(false);
    patientList = await ApiProvider.ViewPatientsListApi();
    print(patientList);
    if (patientList?.response != null) {
      isLoading(false);
      founlistpatientappointment.value = patientList!.response!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    patientListApi();
  }

  @override
  void onClose() {
    patientList = null;
    super.onClose();
  }

  @override
  void dispose() {
    patientList = null;
    super.dispose();
  }

  RxList<PatientListss> founlistpatientappointment = RxList<PatientListss>([]);
  void filterappointmentt(String searclistpatientName) {
    List<PatientListss>? finalResult = [];
    if (searclistpatientName.isEmpty) {
      finalResult = patientList!.response!;
    } else {
      finalResult = patientList!.response!
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
