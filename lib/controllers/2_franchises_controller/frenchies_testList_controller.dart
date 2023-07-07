import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchies_testList_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class FrenchiesTestListController extends GetxController{
  RxBool isLoading = false.obs;
  FrenchiesTestListModel? getFrenchiesTestListModel;
  TextEditingController? testNameController;
  void frenchiesTestListApi()async{
    isLoading(true);
    getFrenchiesTestListModel = await ApiProvider.FrenchiesTestListApi();
    if(getFrenchiesTestListModel != null){
        isLoading(false);
        ///for search filter
        foundPaymentnurse.value = getFrenchiesTestListModel!.testList!;
    }
  }
  void frenchiesDeleteTestListApi(int id)async{
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesDeleteTestList(id);
    if(r.statusCode == 200){
      isLoading(false);
    }
  }
  void frenchiesEditTestList(id)async{
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesEditTestList(id,testNameController?.text);
    if(r.statusCode == 200){
      isLoading(false);
    }
  }
  @override
  void onInit() {
    frenchiesTestListApi();
    testNameController = TextEditingController();
    super.onInit();
  }
  /// for search filter
  RxList<TestList> foundPaymentnurse = RxList<TestList>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<TestList>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getFrenchiesTestListModel!.testList!;
    } else {
      finalResult = getFrenchiesTestListModel!.testList!
          .where((element) => element.testName
          .toString()
          .toLowerCase()
          .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult.length);
    foundPaymentnurse.value = finalResult;
  }
  @override
  void dispose() {
    super.dispose();
  }
}