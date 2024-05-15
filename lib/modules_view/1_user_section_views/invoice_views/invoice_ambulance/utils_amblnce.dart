import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/invoice_controller/invoice_nrs_controller.dart';

InvoiceNrsController _invoicenrsController = Get.put(InvoiceNrsController());

class Utils {
  static formatPrice(double price) =>
      //'${220}'.toString();
      '${_invoicenrsController.getnurseinvoice!.grandTotal?.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}
