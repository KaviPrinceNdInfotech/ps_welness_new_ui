import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/invoice_controller/invoice_controller.dart';

InvoiceMedicineController _invoiceController =
    Get.put(InvoiceMedicineController());

class Utils {
  static formatPrice(double price) =>
      //'${220}'.toString();
      '${_invoiceController.getmedicineinvoice!.grandTotal?.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}
