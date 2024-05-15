import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesDept&SpecList2_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesDept&SpecList_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

import '../../../model/franchies_models/franchies_specialist.dart';

class FranchiesSpecialistController extends GetxController {
  RxBool isLoading = true.obs;
  SpealistFranchies? spealistFranchies;
  DeptSpecList2Model? getDeptSpecList2Model;
  FrenchiesDepartmentListModel? frenchiesDepartmentListModel;
  TextEditingController? IdController, DepartmentNameController;

  void franchiesSpecialistListssApi() async {
    isLoading(true);
    getDeptSpecList2Model = await ApiProvider.FrenchiesDeptSpecList2Api();
    if (getDeptSpecList2Model?.deptspecList != null) {
      isLoading(false);
    }
  }

  void franchiesDeptAndSpecListsApi() async {
    isLoading(true);
    frenchiesDepartmentListModel = await ApiProvider.FrenchiesDeptSpecListApi();
    if (frenchiesDepartmentListModel != null) {
      isLoading(false);

      ///for search filter
      data.value = frenchiesDepartmentListModel!.deptList!;
    }
  }

  void frenchiesDeleteDepartment(int id) async {
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesDeleteDepartment(id);
    if (r.statusCode == 200) {
      isLoading(false);
    }
  }

  void frenchiesEditDepartment(
    int id,
  ) async {
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesEditDepartment(
        id, DepartmentNameController?.text);
    if (r.statusCode == 200) {
      isLoading(false);
    }
  }

  /// for search filter
  RxList<DeptList> data = RxList<DeptList>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<DeptList>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = frenchiesDepartmentListModel!.deptList!;
    } else {
      finalResult = frenchiesDepartmentListModel!.deptList!
          .where((element) => element.departmentName
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
    franchiesSpecialistListssApi();
    franchiesDeptAndSpecListsApi();
    IdController = TextEditingController();
    DepartmentNameController = TextEditingController();
  }

  @override
  void dispose() {
    // Get.delete<FranchiesSpecialistController>();
    super.dispose();
  }
}
