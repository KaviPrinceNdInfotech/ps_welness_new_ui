import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_details_api.dart';

import '../../../model/1_user_model/lab_list_models.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/lab_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class LabListController extends GetxController {
  RxBool isLoading = true.obs;

  LabListUser? labListUser;
  Labdetailbyid? labdetailsbyid;

  void labListApi() async {
    isLoading(true);
    labListUser = await ApiProvider.ViewLabListApi();
    print('Prince lab list');
    print(labListUser);
    if (labListUser != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundProducts.value = labListUser!.labList;
      //Get.to(()=>Container());
    }
  }
///lab_detail_api.....................18april....2023..
  void labdetailApi() async {
    isLoading(true);
    labdetailsbyid = await ApiProvider.ViewLabdetailsApi();
    print('Prince lab sedule.........');
    print(labdetailsbyid);
    if (labdetailsbyid?.year != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }


  @override
  void onInit() {
    super.onInit();
    labListApi();
    labdetailApi();
  }

  @override
  void onClose() {
    labListUser = null;
    super.onClose();
  }

  @override
  void dispose() {
    labListUser = null;
    super.dispose();
  }

  RxList<LabList> foundProducts = RxList<LabList>([]);

  void filterProduct (String searchlabName) {
    List<LabList> finalResult = [];
    if (searchlabName.isEmpty) {
      finalResult = labListUser!.labList;
    }else {
      finalResult = labListUser!.labList.where((element) =>
    element.labName.toString().toLowerCase()
    .contains(searchlabName.toString().toLowerCase().trim())
    ).toList();
    }
    print(finalResult.length);
    foundProducts.value = finalResult;
  }



}

///todo from here checkout model value..............
