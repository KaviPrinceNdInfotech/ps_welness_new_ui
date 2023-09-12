// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:intl/intl.dart';
//
// import '../api/pdf_api.dart';
// import '../api/pdf_invoice_api.dart';
// import '../model/customer.dart';
// import '../model/invoice.dart';
// import '../model/supplier.dart';
// import '../widget/button_widget.dart';
// import '../widget/title_widget.dart';
//
// class PdfPage extends StatefulWidget {
//   @override
//   _PdfPageState createState() => _PdfPageState();
// }
//
// var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
// var inputDate = inputFormat.parse('31/12/2000 23:59'); // <-- dd/MM 24H format
//
// var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
// var outputDate = outputFormat.format(inputDate);
//
// class _PdfPageState extends State<PdfPage> {
//   static String Id = ''.toString();
//   var prefs = GetStorage();
//
//   ///Future<Result2>? list;
//   @override
//   void initState() {
//     super.initState();
//
//     ///list = _getData();
//   }
//
//   ///todo: after api it will be appear...
//
//   // Future<Result2> _getData() async {
//   //   var prefs = GetStorage();
//   //   //saved id..........
//   //   //prefs.write("Id".toString(), json.decode(r.body)['Id']);
//   //   Id = prefs.read("Id").toString();
//   //   print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
//   //   //String url = 'https://api.gyros.farm/api/Order/Invoice/$Id';
//   //   /// url = 'https://api.gyros.farm/api/Order/Invoice/93';
//   //
//   //   final response = await http.get(Uri.parse(url));
//   //   if (response.statusCode == 200) {
//   //     final data = json.decode(response.body) as Map<String, dynamic>;
//   //     var myData = Result2.fromJson(data['result']);
//   //     print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&: ${myData.id.toString()}');
//   //     return myData;
//   //   } else {
//   //     throw Exception('Failed to load data');
//   //   }
//   // }
//   ///todo: end
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           title: Text('ROSHINI'),
//           centerTitle: true,
//         ),
//         body: Container(
//           padding: EdgeInsets.all(32),
//           child: Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TitleWidget(
//                 icon: Icons.picture_as_pdf,
//                 text: 'Generate Invoice',
//               ),
//               const SizedBox(height: 48),
//
//               ///open after api....appear prince
//               // FutureBuilder<Result2>(
//               //
//               //     /// future: _getData(),
//               //     builder: (context, snapshot) {
//               //   if (snapshot.hasData) {
//               //     //var items = snapshot.data;
//               //     return
//               ButtonWidget(
//                 text: 'Invoice PDF',
//                 onClicked: () async {
//                   final date = DateTime.now();
//                   final dueDate = date.add(Duration(days: 7));
//
//                   final invoice = Invoice(
//                     supplier: Supplier(
//                       name: 'Name: Kumar Prince',
//                       //'${items!.name.toString()}',
//                       email: 'Email: kp@gmail.com',
//                       //'${items!.email}',
//                       address: 'Address: Noida sector2',
//                       //'${items!.address}',
//                       mobile: 'Mobile no: 90987766',
//                       //'${items!.mobile}',
//                       pin: 'Pin: 564433',
//                       //'${items.pinCode}',
//                       returnPolicy:
//                           'If the item is defective or not as described,you may return it during delivery directly or you may request for'
//                           'return within 10 days of delivery for items that are defective or are different from what you ordered.'
//                           ' items must be complete, free from damages and for items returned for being different from what you '
//                           'ordred, they must be unopened as well.',
//                       office:
//                           'Roshini private limited,2nd floor,plot No. 82,Noida,UttarPradesh',
//                     ),
//                     customer: Customer(
//                       order: 'OrderId: 12 ',
//                       //'${items.id.toString()}',
//                       invoiceNumber: 'Invoice number: 10',
//                       //'${items.userId.toString()}',
//                       paymentMethod: 'Payment method: online ',
//                       //'${items.paymentMode}',
//                       totalItems: 'Total items: 3 ',
//                       //'${items.totalItem.toString()}'
//                       /* name: 'Apple Inc.',
//                              address: 'Apple Street, Cupertino, CA 95014',*/
//                     ),
//                     info: InvoiceInfo(
//                         orderDate: inputFormat.parse('31/12/2000 23:59'),
//                         //items!.date,
//                         invoiceDate: inputFormat.parse('31/12/2000 23:59'),
//                         //items.date,
//                         orderStatus: 'online',
//                         //items.orderStatus.toString(),
//                         paymentStatus: 'Done'
//                         //items.paymentStatus.toString(),
//                         ),
//                     items: [
//                       InvoiceItem(
//                         description: 'car',
//                         //description: items.productName,
//                         // date: DateTime.now(),
//                         quantity: 8,
//                         vat: 0.19,
//                         unitPrice: 1200.toDouble(),
//                         //items!.price.toDouble(),
//                       ),
//                       InvoiceItem(
//                         description: 'bike',
//                         // date: DateTime.now(),
//                         quantity: 3,
//                         vat: 0.19,
//                         unitPrice: 2.99.toDouble(),
//                       ),
//                       InvoiceItem(
//                         description: 'Ac',
//                         // date: DateTime.now(),
//                         quantity: 8,
//                         vat: 0.19,
//                         unitPrice: 3.99.toDouble(),
//                       ),
//                       InvoiceItem(
//                         description: 'Freze',
//                         // date: DateTime.now(),
//                         quantity: 1,
//                         vat: 0.19,
//                         unitPrice: 1.59.toDouble(),
//                       ),
//                       InvoiceItem(
//                         description: 'Tv',
//                         //date: DateTime.now(),
//                         quantity: 5,
//                         vat: 0.19,
//                         unitPrice: 0.99.toDouble(),
//                       ),
//                       InvoiceItem(
//                         description: 'Machine',
//                         //date: DateTime.now(),
//                         quantity: 4,
//                         vat: 0.19,
//                         unitPrice: 1.29.toDouble(),
//                       ),
//                     ],
//                   );
//
//                   final pdfFile = await PdfInvoiceApi.generate(invoice);
//
//                   PdfApi.openFile(pdfFile);
//                 },
//               ),
//
//               ///todo after api....appear prince 17 august..
//
//               //}
//               // else if (snapshot.hasError) {
//               //   return Text("${snapshot.error}");
//               // }
//               //return Center(child: CircularProgressIndicator());
//               /// })
//               ///todo: after api it will appear...
//             ],
//           )),
//         ),
//       );
// }
