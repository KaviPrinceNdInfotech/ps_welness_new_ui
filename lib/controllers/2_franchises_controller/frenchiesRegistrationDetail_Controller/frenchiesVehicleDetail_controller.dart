import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleDetails_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrenchiesVehicleDetailController extends GetxController {
  RxBool isLoading = true.obs;
  FrenchiesVehicleDetailModel? getfrenchiesVehicleDetailModel;

  Future<void> FrenchiesVehicleDetailApi() async {
    isLoading(true);
    getfrenchiesVehicleDetailModel = await ApiProvider.FrenchiesVehicleDetail();
    if (getfrenchiesVehicleDetailModel?.vehicleRegDetail != null) {
      isLoading(false);

      ///for search filter
      data.value = getfrenchiesVehicleDetailModel!.vehicleRegDetail!;
    }
  }

  @override
  void onInit() {
    FrenchiesVehicleDetailApi();
    super.onInit();
  }

  /// for search filter
  RxList<VehicleRegDetail> data = RxList<VehicleRegDetail>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<VehicleRegDetail>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesVehicleDetailModel!.vehicleRegDetail!;
    } else {
      finalResult = getfrenchiesVehicleDetailModel!.vehicleRegDetail!
          .where((element) => element.vehicleOwnerName
              .toString()
              .toLowerCase()
              .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
