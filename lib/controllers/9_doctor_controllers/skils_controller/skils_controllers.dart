import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/get_all_skils_model/get_all_skils_model.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';


class SkillsListController extends GetxController {
  RxBool isLoading = true.obs;

  GetskillsModel? viewSkilsReport;

  // void skillsListApi() async {
  //   isLoading(false);
  //   skillsList = await ApiProvider.getSkillsApi();
  //   print('Prince skils list');
  //   print(skillsList);
  //   if (skillsList != null) {
  //     //Get.to(() => TotalPrice());
  //     isLoading(false);
  //     //Get.to(()=>Container());
  //   }
  // }



  void skillsListApi() async {
    isLoading(true);
    viewSkilsReport = await ApiProvider.getSkillsApi();
    if (viewSkilsReport?.skills != null
    //getcatagartlist!.result!.isNotEmpty
    ) {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    super.onInit();
    skillsListApi();

  }

  // @override
  // void onClose() {
  //   skillsList != null;
  //   super.onClose();
  // }

  @override
  void dispose() {
    Get.delete<SkillsListController>();
    //skillsList != null;
    super.dispose();
  }
}

///todo from here checkout model value..............
