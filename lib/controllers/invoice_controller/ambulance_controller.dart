// import 'package:get/get.dart';
// import 'package:gyros_app/models/invoice_model/invoice_model.dart';
// import 'package:gyros_app/services/api_provider.dart';
//
//
//
// class InvoiceController extends GetxController{
//
//   RxBool isLoading = true.obs;
//
//   InvoiceModel? getinvoicepoints;
//
//   void invoiceApi() async{
//
//     isLoading(true);
//     getinvoicepoints = await ApiProvider.InvoiceApi() ;
//     if(getinvoicepoints != null){
//       print("hjksdhvcnv: ${getinvoicepoints}");
//       isLoading(false);
//
//     }
//   }
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     invoiceApi();
//   }
//
//   @override
//   void dispose() {
//     Get.delete<InvoiceController>();
//     super.dispose();
//   }
//
// }

// import 'package:demo/pdf_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_doctor/page_dr/pdf_page_doctor.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../modules_view/1_user_section_views/invoice_views/invoice_ambulance/model_ambulance/models_amblnce/ambulance_modelss.dart';
import '../../modules_view/1_user_section_views/invoice_views/invoice_ambulance/page_amblnce/amblnce_page_invoice.dart';
//import '../../modules_view/1_user_section_views/invoice_views/model/models/medicine_modelss.dart';
//import '../../modules_view/1_user_section_views/invoice_views/page/pdf_page_medicine.dart';
// import 'api_provider.dart';

class InvoiceAmblnceController extends GetxController {
  RxBool isLoading = true.obs;
  String Invoice = '';

  InvoiceAmbulanceUser? getamblnceinvoice;
  void invoiceListsamblncdeApi() async {
    isLoading(true);
    getamblnceinvoice = await ApiProvider.invoiceAmblnceApi(
        //getamblnceinvoice?.invoiceNumber.toString()
        );
    if (getamblnceinvoice != null) {
      Get.to(
        () => PdfPageAmb(), //next page class
        duration: Duration(
            milliseconds: 300), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    invoiceListsamblncdeApi();
  }

  @override
  void dispose() {
    Get.delete<InvoiceAmblnceController>();
    super.dispose();
  }
}
