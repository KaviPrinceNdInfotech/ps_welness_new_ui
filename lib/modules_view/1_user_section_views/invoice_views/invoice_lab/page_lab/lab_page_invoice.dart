import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/controllers/invoice_controller/invoice_lab_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_lab/model_lab/supplier_lab.dart';

import '../api_lab/pdf_lab_api.dart';
import '../api_lab/pdf_lab_invoice_api.dart';
import '../model_lab/customer.dart';
import '../model_lab/invoice.dart';
import '../widget_lab/button_widget.dart';
import '../widget_lab/title_widget.dart';
// import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_doctor/api_dr/pdf_dr_api.dart';
// import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_doctor/api_dr/pdf_dr_invoice_api.dart';
// import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_doctor/model_dr/customer.dart';
// import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_doctor/model_dr/invoice.dart';
// import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_doctor/model_dr/supplier_dr.dart';
// import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_doctor/widget_dr/button_widget.dart';
// import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_doctor/widget_dr/title_widget.dart';

class PdfPageLab extends StatelessWidget {
  PdfPageLab({Key? key}) : super(key: key);
  // HomePageController _homePageController = Get.put(HomePageController());
  InvoiceLabController _invoicelabController = Get.put(InvoiceLabController());
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

    return Obx(
      () => (_invoicelabController.isLoading.value)
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
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
                          final invoice = Invoice(
                            supplierlab: SupplierLab(
                              name:
                                  "${_invoicelabController.getlabinvoice!.name.toString()}",
                              // name: 'N S Bhatt',
                              //"${_invoiceController.getinvoidelist?.name.toString()}",
                              email:
                                  "${_invoicelabController.getlabinvoice!.email.toString()}",
                              //"${_invoiceController.getinvoidelist?.email.toString()}",
                              address:
                                  "${_invoicelabController.getlabinvoice!.address.toString()}",
                              //"${_invoiceController.getinvoidelist?.address.toString()}",
                              mobile:
                                  "Mobile:${_invoicelabController.getlabinvoice!.mobileNo.toString()}",
                              // "${_invoiceController.getinvoidelist?.mobile.toString()}",
                              pin:
                                  "Pin:${_invoicelabController.getlabinvoice!.pinCode.toString()}",
                              // "${_invoiceController.getinvoidelist?.pinCode.toString()}",
                              cancellationPolicy:
                                  'Thank-you We are available for you 24*7 and we will provide the best services and solutions of medical field ',
                              officelab:
                                  '278B, 1ST FLOOR, LEERA RAM MARKET MASJID MOTH'
                                  'SOUTH EX. PAPER-2, Masjid Moth Village, South Extension.'
                                  'II, New Delhi, Delhi 110049.',
                            ),
                            customer: Customer(
                              order:
                                  //"pending",
                                  "OrderId:${_invoicelabController.getlabinvoice!.orderId.toString()}",
                              invoiceNumber:
                                  //"6767566588",
                                  "InvoiceNo:${_invoicelabController.getlabinvoice!.invoiceNumber.toString()}",
                              paymentMethod:
                                  //"online",
                                  "PaymentMode:Online",

                              ///totalItems: "5",
                              // "${_invoiceController.getinvoidelist?.result?.first.totalItem.toString()}"
                              /* name: 'Apple Inc.',
                                         address: 'Apple Street, Cupertino, CA 95014',*/
                            ),
                            info: InvoiceInfo(
                              orderDate: DateTime.now(),
                              // invoiceDate: items.date,
                              // orderDate: DateTime.now(),
                              invoiceDate: DateTime.now(),
                              orderStatus: "Done",
                              //  "${_invoiceController.getinvoidelist?.result?.first.orderStatus.toString()}",
                              paymentStatus: "Done",
                              // "${_invoiceController.getinvoidelist?.result?.first.paymentStatus.toString()}",
                            ),
                            items: [
                              InvoiceItem(
                                // description: "${_invoiceController.getinvoidelist?.result?.first.productName.toString()}",
                                description:
                                    // "ps wellness healthcare sector service",
                                    "${_invoicelabController.getlabinvoice!.invoiceData![0].labName.toString()}",
                                // date: DateTime.now(),
                                quantity: int.parse(
                                    '${_invoicelabController.getlabinvoice!.invoiceData![0].id}'),
                                //"{_invoiceController.getmedicineinvoice!.invoiceData![0].medicineName()}",
                                vat: double.parse(
                                    '${_invoicelabController.getlabinvoice!.invoiceData![0].gst.toString()}'),
                                unitPrice: double.parse(
                                    "${_invoicelabController.getlabinvoice!.invoiceData![0].testAmount.toString()}"),
                                total: double.parse(
                                    "${_invoicelabController.getlabinvoice!.invoiceData![0].amount.toString()}"),
                              ),
                              // InvoiceItem(
                              //   description: 'Mango',
                              //   // date: DateTime.now(),
                              //   quantity: 3,
                              //   vat: 0.19,
                              //   unitPrice: 2.99.toDouble(),
                              // ),
                              // InvoiceItem(
                              //   description: 'Onion',
                              //   // date: DateTime.now(),
                              //   quantity: 8,
                              //   vat: 0.19,
                              //   unitPrice: 3.99.toDouble(),
                              // ),
                              // InvoiceItem(
                              //   description: 'Carrot',
                              //   // date: DateTime.now(),
                              //   quantity: 1,
                              //   vat: 0.19,
                              //   unitPrice: 1.59.toDouble(),
                              // ),
                              // InvoiceItem(
                              //   description: 'Papaya',
                              //   //date: DateTime.now(),
                              //   quantity: 5,
                              //   vat: 0.19,
                              //   unitPrice: 0.99.toDouble(),
                              // ),
                              // InvoiceItem(
                              //   description: 'Pumpkin',
                              //   //date: DateTime.now(),
                              //   quantity: 4,
                              //   vat: 0.19,
                              //   unitPrice: 1.29.toDouble(),
                              // ),
                            ],
                          );

                          ///4342424253y56u67uy5t4r3e2w1  q
                          // final invoice = Invoice(
                          //   supplier: Supplier(
                          //     name:
                          //         "${_invoiceController.getmedicineinvoice!.name.toString()}",
                          //     //'${items!.name.toString()}',
                          //     email:
                          //         "${_invoiceController.getmedicineinvoice!.email.toString()}",
                          //     //'${items!.email}',
                          //     address:
                          //         "${_invoiceController.getmedicineinvoice!.address.toString()}",
                          //     //'${items!.address}',
                          //     mobile:
                          //         'Mobile no:${_invoiceController.getmedicineinvoice!.mobileNo.toString()}',
                          //     //'${items!.mobile}',
                          //     pin:
                          //         'Pin: ${_invoiceController.getmedicineinvoice!.pinCode.toString()}',
                          //     //'${items.pinCode}',
                          //     returnPolicy:
                          //         'If the item is defective or not as described,you may return it during delivery directly or you may request for'
                          //         'return within 10 days of delivery for items that are defective or are different from what you ordered.'
                          //         ' items must be complete, free from damages and for items returned for being different from what you '
                          //         'ordred, they must be unopened as well.',
                          //     office: '278B, 1ST FLOOR, LEERA RAM MARKET MASJID MOTH,'
                          //         'SOUTH EX. PAPER-2, Masjid Moth Village, South Extension.'
                          //         'II, New Delhi, Delhi 110049.',
                          //   ),
                          //   customer: Customer(
                          //     order:
                          //         'OrderId:${_invoiceController.getmedicineinvoice!.orderId}',
                          //     //'${items.id.toString()}',
                          //     invoiceNumber:
                          //         'Invoice number:${_invoiceController.getmedicineinvoice!.invoiceNumber}',
                          //     //'${items.userId.toString()}',
                          //     paymentMethod: 'Payment method: online ',
                          //     //'${items.paymentMode}',
                          //     // totalItems: 'Total items: 3 ',
                          //     //'${items.totalItem.toString()}'
                          //     /* name: 'Apple Inc.',
                          //            address: 'Apple Street, Cupertino, CA 95014',*/
                          //   ),
                          //   info: InvoiceInfo(
                          //       orderDate: inputFormat.parse(
                          //           "${_invoiceController.getmedicineinvoice!.invoiceData}"),
                          //       //items!.date,
                          //       invoiceDate: inputFormat.parse(
                          //           "${_invoiceController.getmedicineinvoice!.invoiceData}"),
                          //       //items.date,
                          //       orderStatus: 'Done',
                          //       //items.orderStatus.toString(),
                          //       paymentStatus: 'Online'
                          //       //items.paymentStatus.toString(),
                          //       ),
                          //   items: [
                          //     InvoiceItem(
                          //       description: 'Vicks',
                          //       //description: items.productName,
                          //       // date: DateTime.now(),
                          //       quantity: 8,
                          //       vat: 0.19,
                          //       unitPrice: 1200.toDouble(),
                          //       //items!.price.toDouble(),
                          //     ),
                          //     InvoiceItem(
                          //       description: 'Dolo 650',
                          //       // date: DateTime.now(),
                          //       quantity: 3,
                          //       vat: 0.19,
                          //       unitPrice: 2.99.toDouble(),
                          //     ),
                          //     InvoiceItem(
                          //       description: 'Paracetamol',
                          //       // date: DateTime.now(),
                          //       quantity: 8,
                          //       unitPrice: 3.99.toDouble(),
                          //       vat: 0.19,
                          //     ),
                          //     InvoiceItem(
                          //       description: 'Zticon',
                          //       // date: DateTime.now(),
                          //       quantity: 1,
                          //       vat: 0.19,
                          //       unitPrice: 1.59.toDouble(),
                          //     ),
                          //     InvoiceItem(
                          //       description: 'Introciniol',
                          //       //date: DateTime.now(),
                          //       quantity: 5,
                          //       vat: 0.19,
                          //       unitPrice: 0.99.toDouble(),
                          //     ),
                          //     InvoiceItem(
                          //       description: 'Glycogen',
                          //       //date: DateTime.now(),
                          //       quantity: 4,
                          //       vat: 0.19,
                          //       unitPrice: 1.29.toDouble(),
                          //     ),
                          //   ],
                          // );

                          ///
                          try {
                            print("E1 ${invoice.toString()}");
                            final pdfFile =
                                await PdfInvoiceApi.generate(invoice);
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
