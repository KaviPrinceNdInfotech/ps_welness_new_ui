import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../controllers/invoice_controller/invoice_controller.dart';
import '../api/pdf_api.dart';
import '../api/pdf_invoice_api.dart';
import '../model/customer.dart';
import '../model/invoice.dart';
import '../model/supplier.dart';
import '../widget/button_widget.dart';
import '../widget/title_widget.dart';

class PdfPageMedicine extends StatelessWidget {
  PdfPageMedicine({Key? key}) : super(key: key);
  // HomePageController _homePageController = Get.put(HomePageController());
  InvoiceController _invoiceController = Get.put(InvoiceController());
  //UserProfileControllers _getProfileController =
  // Get.put(UserProfileControllers());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    var inputDate =
        inputFormat.parse('31/12/2000 23:59'); // <-- dd/MM 24H format

    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          //  MyApp.title,

          "P S Wellness",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleWidget(
              icon: Icons.picture_as_pdf,
              text: 'Generate Invoice',
            ),
            const SizedBox(height: 48),
            //     () => (_invoiceController.isLoading.value)
            //     ? Center(child: CircularProgressIndicator())
            //     :_invoiceController.getinvoidelist!.result!.isEmpty
            //     ? Center(
            //   child: Text('No List'),
            // )

            ButtonWidget(
                text: 'Invoice PDF',
                onClicked: () async {
                  // print(
                  //     "jkijmbjobmo: ${_invoiceController.getinvoidelist?.result?.first.invoice.toString()}");

                  final date = DateTime.now();
                  final dueDate = date.add(Duration(days: 7));

                  ///
                  // final invoice = Invoice(
                  //   supplier: Supplier(
                  //     // name: "${ _getProfileController.orderHistoryModel!.result[0].productName.toString()}",
                  //     name: 'N S Bhatt',
                  //     //"${_invoiceController.getinvoidelist?.name.toString()}",
                  //     email: 'ps@gmail.com',
                  //     //"${_invoiceController.getinvoidelist?.email.toString()}",
                  //     address: 'Lajpatnagar delhi 110095',
                  //     //"${_invoiceController.getinvoidelist?.address.toString()}",
                  //     mobile: "37777773676",
                  //     // "${_invoiceController.getinvoidelist?.mobile.toString()}",
                  //     pin: '11122',
                  //     // "${_invoiceController.getinvoidelist?.pinCode.toString()}",
                  //     returnPolicy:
                  //         'If the item is defective or not as described,you may return it during delivery directly or you may request for'
                  //         'return within 10 days of delivery for items that are defective or are different from what you ordered.'
                  //         ' items must be complete, free from damages and for items returned for being different from what you '
                  //         'ordred, they must be unopened as well.',
                  //     office:
                  //         "PS Wellness,2nd floor,plot No. 82,Noida,UttarPradesh",
                  //   ),
                  //   customer: Customer(
                  //     order: "pending",
                  //     // "${_invoiceController.getinvoidelist?.result?.first.orderStatus.toString()}",
                  //     invoiceNumber: "6767566588",
                  //     //"${_invoiceController.getinvoidelist?.result?.first.invoice.toString()}",
                  //     paymentMethod: "online",
                  //     // "${_invoiceController.getinvoidelist?.result?.first.paymentMode.toString()}",
                  //     totalItems: "5",
                  //     // "${_invoiceController.getinvoidelist?.result?.first.totalItem.toString()}"
                  //     /* name: 'Apple Inc.',
                  //                      address: 'Apple Street, Cupertino, CA 95014',*/
                  //   ),
                  //   info: InvoiceInfo(
                  //     // orderDate: items.date,
                  //     // invoiceDate: items.date,
                  //     orderDate: DateTime.now(),
                  //     invoiceDate: DateTime.now(),
                  //     orderStatus: "pending",
                  //     //  "${_invoiceController.getinvoidelist?.result?.first.orderStatus.toString()}",
                  //     paymentStatus: "online",
                  //     // "${_invoiceController.getinvoidelist?.result?.first.paymentStatus.toString()}",
                  //   ),
                  //   items: [
                  //     InvoiceItem(
                  //       // description: "${_invoiceController.getinvoidelist?.result?.first.productName.toString()}",
                  //       description: "ps wellness healthcare sector service",
                  //       // "${_invoiceController.getinvoidelist!.result![0].productName.toString()}",
                  //       // date: DateTime.now(),
                  //       quantity: 0,
                  //       vat: 18,
                  //       unitPrice: 0,
                  //     ),
                  //     // InvoiceItem(
                  //     //   description: 'Mango',
                  //     //   // date: DateTime.now(),
                  //     //   quantity: 3,
                  //     //   vat: 0.19,
                  //     //   unitPrice: 2.99.toDouble(),
                  //     // ),
                  //     // InvoiceItem(
                  //     //   description: 'Onion',
                  //     //   // date: DateTime.now(),
                  //     //   quantity: 8,
                  //     //   vat: 0.19,
                  //     //   unitPrice: 3.99.toDouble(),
                  //     // ),
                  //     // InvoiceItem(
                  //     //   description: 'Carrot',
                  //     //   // date: DateTime.now(),
                  //     //   quantity: 1,
                  //     //   vat: 0.19,
                  //     //   unitPrice: 1.59.toDouble(),
                  //     // ),
                  //     // InvoiceItem(
                  //     //   description: 'Papaya',
                  //     //   //date: DateTime.now(),
                  //     //   quantity: 5,
                  //     //   vat: 0.19,
                  //     //   unitPrice: 0.99.toDouble(),
                  //     // ),
                  //     // InvoiceItem(
                  //     //   description: 'Pumpkin',
                  //     //   //date: DateTime.now(),
                  //     //   quantity: 4,
                  //     //   vat: 0.19,
                  //     //   unitPrice: 1.29.toDouble(),
                  //     // ),
                  //   ],
                  // );

                  ///
                  final invoice = Invoice(
                    supplier: Supplier(
                      name: 'Name: Kumar Prince',
                      //'${items!.name.toString()}',
                      email: 'Email: prince@gmail.com',
                      //'${items!.email}',
                      address: 'Address: Noida sector2',
                      //'${items!.address}',
                      mobile: 'Mobile no: 9098776699',
                      //'${items!.mobile}',
                      pin: 'Pin: 564433',
                      //'${items.pinCode}',
                      returnPolicy:
                          'If the item is defective or not as described,you may return it during delivery directly or you may request for'
                          'return within 10 days of delivery for items that are defective or are different from what you ordered.'
                          ' items must be complete, free from damages and for items returned for being different from what you '
                          'ordred, they must be unopened as well.',
                      office:
                          'P S Wellness,2nd floor,plot No. 82,Noida,UttarPradesh',
                    ),
                    customer: Customer(
                      order: 'OrderId: 12 ',
                      //'${items.id.toString()}',
                      invoiceNumber: 'Invoice number: 10',
                      //'${items.userId.toString()}',
                      paymentMethod: 'Payment method: online ',
                      //'${items.paymentMode}',
                      totalItems: 'Total items: 3 ',
                      //'${items.totalItem.toString()}'
                      /* name: 'Apple Inc.',
                             address: 'Apple Street, Cupertino, CA 95014',*/
                    ),
                    info: InvoiceInfo(
                        orderDate: inputFormat.parse('31/12/2000 23:59'),
                        //items!.date,
                        invoiceDate: inputFormat.parse('31/12/2000 23:59'),
                        //items.date,
                        orderStatus: 'online',
                        //items.orderStatus.toString(),
                        paymentStatus: 'Done'
                        //items.paymentStatus.toString(),
                        ),
                    items: [
                      InvoiceItem(
                        description: 'Vicks',
                        //description: items.productName,
                        // date: DateTime.now(),
                        quantity: 8,
                        vat: 0.19,
                        unitPrice: 1200.toDouble(),
                        //items!.price.toDouble(),
                      ),
                      InvoiceItem(
                        description: 'Dolo 650',
                        // date: DateTime.now(),
                        quantity: 3,
                        vat: 0.19,
                        unitPrice: 2.99.toDouble(),
                      ),
                      InvoiceItem(
                        description: 'Paracetamol',
                        // date: DateTime.now(),
                        quantity: 8,
                        unitPrice: 3.99.toDouble(),
                        vat: 0.19,
                      ),
                      InvoiceItem(
                        description: 'Zticon',
                        // date: DateTime.now(),
                        quantity: 1,
                        vat: 0.19,
                        unitPrice: 1.59.toDouble(),
                      ),
                      InvoiceItem(
                        description: 'Introciniol',
                        //date: DateTime.now(),
                        quantity: 5,
                        vat: 0.19,
                        unitPrice: 0.99.toDouble(),
                      ),
                      InvoiceItem(
                        description: 'Glycogen',
                        //date: DateTime.now(),
                        quantity: 4,
                        vat: 0.19,
                        unitPrice: 1.29.toDouble(),
                      ),
                    ],
                  );

                  ///
                  try {
                    print("E1 ${invoice.toString()}");
                    final pdfFile = await PdfInvoiceApi.generate(invoice);
                    print("E2 ${pdfFile.toString()}");
                    PdfApi.openFile(pdfFile);
                  } catch (error) {
                    print("errorr:${error}");
                  }
                }),

            ///old code
            // FutureBuilder<Result2>(
            //     future: _getData(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         var items = snapshot.data;
            //         return ButtonWidget(
            //           text: 'Invoice PDF',
            //           onClicked: () async {
            //             final date = DateTime.now();
            //             final dueDate = date.add(Duration(days: 7));
            //
            //             final invoice = Invoice(
            //               supplier: Supplier(
            //                 name: 'Name: ${items!.name.toString()}',
            //                 email: 'Email: ${items.email}',
            //                 address: 'Address: ${items.address}',
            //                 mobile: 'Mobile no: ${items.mobile}',
            //                 pin: 'Pin: ${items.pinCode}',
            //                 returnPolicy:
            //                     'If the item is defective or not as described,you may return it during delivery directly or you may request for'
            //                     'return within 10 days of delivery for items that are defective or are different from what you ordered.'
            //                     ' items must be complete, free from damages and for items returned for being different from what you '
            //                     'ordred, they must be unopened as well.',
            //                 office:
            //                     'Gyros private limited,2nd floor,plot No. 82,Noida,UttarPradesh',
            //               ),
            //               customer: Customer(
            //                   order: 'OrderId: ${items.id.toString()}',
            //                   invoiceNumber:
            //                       'Invoice number: ${items.userId.toString()}',
            //                   paymentMethod:
            //                       'Payment method: ${items.paymentMode}',
            //                   totalItems:
            //                       'Total items: ${items.totalItem.toString()}'
            //                   /* name: 'Apple Inc.',
            //                address: 'Apple Street, Cupertino, CA 95014',*/
            //                   ),
            //               info: InvoiceInfo(
            //                 // orderDate: items.date,
            //                 // invoiceDate: items.date,
            //                 orderDate: DateTime.now(),
            //                 invoiceDate: DateTime.now(),
            //                 orderStatus: items.orderStatus.toString(),
            //                 paymentStatus: items.paymentStatus.toString(),
            //               ),
            //               items: [
            //                 InvoiceItem(
            //                   description: items.productName.toString(),
            //                   // date: DateTime.now(),
            //                   quantity: 8,
            //                   vat: 0.19,
            //                   unitPrice: items.price!.toDouble(),
            //                 ),
            //                 InvoiceItem(
            //                   description: 'Mango',
            //                   // date: DateTime.now(),
            //                   quantity: 3,
            //                   vat: 0.19,
            //                   unitPrice: 2.99.toDouble(),
            //                 ),
            //                 InvoiceItem(
            //                   description: 'Onion',
            //                   // date: DateTime.now(),
            //                   quantity: 8,
            //                   vat: 0.19,
            //                   unitPrice: 3.99.toDouble(),
            //                 ),
            //                 InvoiceItem(
            //                   description: 'Carrot',
            //                   // date: DateTime.now(),
            //                   quantity: 1,
            //                   vat: 0.19,
            //                   unitPrice: 1.59.toDouble(),
            //                 ),
            //                 InvoiceItem(
            //                   description: 'Papaya',
            //                   //date: DateTime.now(),
            //                   quantity: 5,
            //                   vat: 0.19,
            //                   unitPrice: 0.99.toDouble(),
            //                 ),
            //                 InvoiceItem(
            //                   description: 'Pumpkin',
            //                   //date: DateTime.now(),
            //                   quantity: 4,
            //                   vat: 0.19,
            //                   unitPrice: 1.29.toDouble(),
            //                 ),
            //               ],
            //             );
            //
            //             final pdfFile = await PdfInvoiceApi.generate(invoice);
            //
            //             PdfApi.openFile(pdfFile);
            //           },
            //         );
            //       } else if (snapshot.hasError) {
            //         return Text(
            //           "${snapshot.error}",
            //           style: GoogleFonts.roboto(
            //             fontWeight: FontWeight.w300,
            //           ),
            //         );
            //       }
            //       return Center(child: CircularProgressIndicator());
            //     })
          ],
        )),
      ),
    );
  }
}

// class PdfPage extends StatefulWidget {
//   @override
//   _PdfPageState createState() => _PdfPageState();
// }
//
// class _PdfPageState extends State<PdfPage> {
//   static String Id = ''.toString();
//   static String invoice = ''.toString();
//   var prefs = GetStorage();
//   Future<Result2>? list;
//
//   @override
//   void initState() {
//     super.initState();
//     list = _getData();
//   }

// Future<Result2> _getData() async {
//   var prefs = GetStorage();
//   //saved id..........
//   //prefs.write("Id".toString(), json.decode(r.body)['Id']);
//   invoice = prefs.read("invoice").toString();
//   print('&&&&&&&&&&&&&&&&&&&&&&:${Invoice}');
//   // String url = 'https://api.gyros.farm/api/Order/Invoice/$Id';
//   String url = 'https://api.gyros.farm/api/Order/InvoiceV1/$invoice ';
//   final response = await http.get(Uri.parse(url));
//   if (response.statusCode == 200) {
//     final data = json.decode(response.body) as Map<String, dynamic>;
//     var myData = Result2.fromJson(data['result']);
//     print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&: ${myData.id.toString()}');
//     return myData;
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

// @override
// Widget build(BuildContext context) {
//   Size size = MediaQuery.of(context).size;
// return  Scaffold(
//   backgroundColor: Colors.black,
//   appBar: AppBar(
//     title: Text(
//
//       MyApp.title,
//       style: GoogleFonts.roboto(
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//     centerTitle: true,
//   ),
//   body: Container(
//     padding: EdgeInsets.all(32),
//     child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TitleWidget(
//               icon: Icons.picture_as_pdf,
//               text: 'Generate Invoice',
//             ),
//             const SizedBox(height: 48),
//             ///Test
//           //  "Save:${_homePageController.getflashsellproduct!.result![index].discountPercentage.toString()}%"
//
//       ButtonWidget(
//         text: 'Invoice PDF',
//         onClicked: () async {
//           final date = DateTime.now();
//           final dueDate = date.add(Duration(days: 7));
//
//           final invoice = Invoice(
//             supplier: Supplier(
//               name: "Save:${_homePageController.getflashsellproduct!.result![index].discountPercentage.toString()}%",
//               email: 'singhricha0902@gmail.com',
//               address: 'Modinagar',
//               mobile: '7456889457',
//               pin: '201204',
//               returnPolicy:
//               'If the item is defective or not as described,you may return it during delivery directly or you may request for'
//                   'return within 10 days of delivery for items that are defective or are different from what you ordered.'
//                   ' items must be complete, free from damages and for items returned for being different from what you '
//                   'ordred, they must be unopened as well.',
//               office:
//               'Gyros private limited,2nd floor,plot No. 82,Noida,UttarPradesh',
//             ),
//             customer: Customer(
//                 order: '5',
//                 invoiceNumber:
//                 '5',
//                 paymentMethod:
//                 'cod',
//                 totalItems:
//                 '2'
//               /* name: 'Apple Inc.',
//                            address: 'Apple Street, Cupertino, CA 95014',*/
//             ),
//             info: InvoiceInfo(
//               // orderDate: items.date,
//               // invoiceDate: items.date,
//               orderDate: DateTime.now(),
//               invoiceDate: DateTime.now(),
//               orderStatus: 'done',
//               paymentStatus: 'done',
//             ),
//             items: [
//               InvoiceItem(
//                 description: 'done',
//                 // date: DateTime.now(),
//                 quantity: 8,
//                 vat: 0.19,
//                 unitPrice: 2,
//               ),
//               InvoiceItem(
//                 description: 'Mango',
//                 // date: DateTime.now(),
//                 quantity: 3,
//                 vat: 0.19,
//                 unitPrice: 2.99.toDouble(),
//               ),
//               InvoiceItem(
//                 description: 'Onion',
//                 // date: DateTime.now(),
//                 quantity: 8,
//                 vat: 0.19,
//                 unitPrice: 3.99.toDouble(),
//               ),
//               InvoiceItem(
//                 description: 'Carrot',
//                 // date: DateTime.now(),
//                 quantity: 1,
//                 vat: 0.19,
//                 unitPrice: 1.59.toDouble(),
//               ),
//               InvoiceItem(
//                 description: 'Papaya',
//                 //date: DateTime.now(),
//                 quantity: 5,
//                 vat: 0.19,
//                 unitPrice: 0.99.toDouble(),
//               ),
//               InvoiceItem(
//                 description: 'Pumpkin',
//                 //date: DateTime.now(),
//                 quantity: 4,
//                 vat: 0.19,
//                 unitPrice: 1.29.toDouble(),
//               ),
//             ],
//           );
//
//           final pdfFile = await PdfInvoiceApi.generate(invoice);
//
//           PdfApi.openFile(pdfFile);
//         },
//       )
//
//
//
//             ///old code
//             // FutureBuilder<Result2>(
//             //     future: _getData(),
//             //     builder: (context, snapshot) {
//             //       if (snapshot.hasData) {
//             //         var items = snapshot.data;
//             //         return ButtonWidget(
//             //           text: 'Invoice PDF',
//             //           onClicked: () async {
//             //             final date = DateTime.now();
//             //             final dueDate = date.add(Duration(days: 7));
//             //
//             //             final invoice = Invoice(
//             //               supplier: Supplier(
//             //                 name: 'Name: ${items!.name.toString()}',
//             //                 email: 'Email: ${items.email}',
//             //                 address: 'Address: ${items.address}',
//             //                 mobile: 'Mobile no: ${items.mobile}',
//             //                 pin: 'Pin: ${items.pinCode}',
//             //                 returnPolicy:
//             //                     'If the item is defective or not as described,you may return it during delivery directly or you may request for'
//             //                     'return within 10 days of delivery for items that are defective or are different from what you ordered.'
//             //                     ' items must be complete, free from damages and for items returned for being different from what you '
//             //                     'ordred, they must be unopened as well.',
//             //                 office:
//             //                     'Gyros private limited,2nd floor,plot No. 82,Noida,UttarPradesh',
//             //               ),
//             //               customer: Customer(
//             //                   order: 'OrderId: ${items.id.toString()}',
//             //                   invoiceNumber:
//             //                       'Invoice number: ${items.userId.toString()}',
//             //                   paymentMethod:
//             //                       'Payment method: ${items.paymentMode}',
//             //                   totalItems:
//             //                       'Total items: ${items.totalItem.toString()}'
//             //                   /* name: 'Apple Inc.',
//             //                address: 'Apple Street, Cupertino, CA 95014',*/
//             //                   ),
//             //               info: InvoiceInfo(
//             //                 // orderDate: items.date,
//             //                 // invoiceDate: items.date,
//             //                 orderDate: DateTime.now(),
//             //                 invoiceDate: DateTime.now(),
//             //                 orderStatus: items.orderStatus.toString(),
//             //                 paymentStatus: items.paymentStatus.toString(),
//             //               ),
//             //               items: [
//             //                 InvoiceItem(
//             //                   description: items.productName.toString(),
//             //                   // date: DateTime.now(),
//             //                   quantity: 8,
//             //                   vat: 0.19,
//             //                   unitPrice: items.price!.toDouble(),
//             //                 ),
//             //                 InvoiceItem(
//             //                   description: 'Mango',
//             //                   // date: DateTime.now(),
//             //                   quantity: 3,
//             //                   vat: 0.19,
//             //                   unitPrice: 2.99.toDouble(),
//             //                 ),
//             //                 InvoiceItem(
//             //                   description: 'Onion',
//             //                   // date: DateTime.now(),
//             //                   quantity: 8,
//             //                   vat: 0.19,
//             //                   unitPrice: 3.99.toDouble(),
//             //                 ),
//             //                 InvoiceItem(
//             //                   description: 'Carrot',
//             //                   // date: DateTime.now(),
//             //                   quantity: 1,
//             //                   vat: 0.19,
//             //                   unitPrice: 1.59.toDouble(),
//             //                 ),
//             //                 InvoiceItem(
//             //                   description: 'Papaya',
//             //                   //date: DateTime.now(),
//             //                   quantity: 5,
//             //                   vat: 0.19,
//             //                   unitPrice: 0.99.toDouble(),
//             //                 ),
//             //                 InvoiceItem(
//             //                   description: 'Pumpkin',
//             //                   //date: DateTime.now(),
//             //                   quantity: 4,
//             //                   vat: 0.19,
//             //                   unitPrice: 1.29.toDouble(),
//             //                 ),
//             //               ],
//             //             );
//             //
//             //             final pdfFile = await PdfInvoiceApi.generate(invoice);
//             //
//             //             PdfApi.openFile(pdfFile);
//             //           },
//             //         );
//             //       } else if (snapshot.hasError) {
//             //         return Text(
//             //           "${snapshot.error}",
//             //           style: GoogleFonts.roboto(
//             //             fontWeight: FontWeight.w300,
//             //           ),
//             //         );
//             //       }
//             //       return Center(child: CircularProgressIndicator());
//             //     })
//           ],
//         )),
//   ),
// );
//   }
// }
