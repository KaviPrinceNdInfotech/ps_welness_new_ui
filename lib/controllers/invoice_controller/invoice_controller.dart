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
// import 'api_provider.dart';

class InvoiceController extends GetxController {
  RxBool isLoading = false.obs;
  String Invoice = '';

  // InvoiceModel? getinvoidelist;

  // void invoiceListssApi() async {
  //   isLoading(false);
  //   getinvoidelist = await ApiProvider.invoiceApi(Invoice.toString());
  //   if (getinvoidelist != null) {
  //     Get.to(
  //       () => PdfPage(), //next page class
  //       duration: Duration(
  //           milliseconds: 300), //duration of transitions, default 1 sec
  //       transition:
  //           // Transition.leftToRight //transition effect
  //           // Transition.fadeIn
  //           //Transition.size
  //           Transition.zoom,
  //     );
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    // invoiceListssApi();
  }

  @override
  void dispose() {
    Get.delete<InvoiceController>();
    super.dispose();
  }
}
