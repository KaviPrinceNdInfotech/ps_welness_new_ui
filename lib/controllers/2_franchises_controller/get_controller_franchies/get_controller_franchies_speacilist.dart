import 'package:get/get.dart';

import '../../../model/franchies_models/franchies_specialist.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/franchies_models/franchies_specialist.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class FranchiesSpecialistController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;

  void toggle(int index) => selectedIndex.value = index;

  SpealistFranchies? spealistFranchies;

  //all catagary list .........

  void franchiesSpecialistListssApi() async {
    isLoading(true);
    spealistFranchies = await ApiProvider.FranchiesSpealistApi();
    if (spealistFranchies != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    franchiesSpecialistListssApi();
  }

  @override
  void dispose() {
    Get.delete<FranchiesSpecialistController>();
    super.dispose();
  }
}
