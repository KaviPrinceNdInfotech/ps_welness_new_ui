import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/controllers/invoice_controller/invoice_dr_controller.dart';

InvoiceDrController _invoicedrController = Get.put(InvoiceDrController());

class Utils {
  static formatPrice(double price) =>
      //'${220}'.toString();
      '${_invoicedrController.getdrinvoice!.grandTotal?.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}
