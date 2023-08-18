import 'package:intl/intl.dart';

//InvoiceController _invoiceController = Get.put(InvoiceController());

class Utils {
  static formatPrice(double price) => '${220}'.toString();
  //' ${_invoiceController.getinvoidelist!.result![0].price.toString()
  //.toStringAsFixed(2)
  //}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}
