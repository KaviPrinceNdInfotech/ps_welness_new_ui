import 'dart:io';

//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_nurse/api_nurse/pdf_nurse_api.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_nurse/model_nurse/supplier_nrs.dart';

import '../../../../../controllers/invoice_controller/invoice_nrs_controller.dart';
import '../model_nurse/customer.dart';
import '../model_nurse/invoice.dart';
import '../utils_nurse.dart';

InvoiceNrsController _invoicenrsController = Get.put(InvoiceNrsController());

//InvoiceController _invoiceController = Get.put(InvoiceController());
class PdfInvoiceApi {
  static Future<File> generate(
    InvoiceNrs invoice,
  ) async {
    ///here changed 29 nov 22
    //final pdf = Document();
    ///here changed 29 nov 22
    //final font = await PdfGoogleFonts.nunitoExtraLight();
    final font = await rootBundle
        .load("lib/assets/fonts/open_sans_cufonfonts/OpenSans-Bold.ttf");
    final ttf = Font.ttf(font);
    final iconImage =
        (await rootBundle.load('lib/assets/image/ps_welness2.png'))
            .buffer
            .asUint8List();
    //(await rootBundle.load(' lib/assets/asset/guser_logo.png')).buffer.asUint8List();

    ///here changed 29 nov 22.........

    final pdf = pw.Document();

    ///here changed 29 nov 22...........
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        buildHeader(invoice, iconImage, ttf),
        /* SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(invoice),*/
        buildInvoice(invoice),
        Divider(),
        buildTotal(),
      ],
      footer: (context) => buildFooter(invoice),
    ));

    return PdfNurseApi.saveDocument(name: 'invoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(InvoiceNrs invoice, iconImage, ttf) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress(invoice.suppliernrs),
              Column(mainAxisSize: MainAxisSize.min, children: [
                ///logo code

                // Image.asset(
                //   'lib/assets/asset/guser_logo.png', scale: 28,
                //   //'lib/assets/asset/guser_logo.png',
                //   // color: AppColors.themecolors,
                //   height: 10.h,
                //   width: 16.w,
                // ),

                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: PdfColors.cyan,
                    shape: BoxShape.circle,
                  ),
                  child: Image(
                    MemoryImage(iconImage),
                    height: 60,
                    width: 60,
                  ),
                ),
                Text(
                  'Tax Invoice/Bill of Supply',
                  style: TextStyle(
                    fontSize: 13.0,
                    font: ttf,
                    color: PdfColors.grey700,
                  ),
                ),
              ]),
            ],
          ),
          //SizedBox(height: 1 * PdfPageFormat.cm),
          Divider(),

          ///this divider is after tex invoice..... and id height 6 then it will gape will be more..
          //SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice.customer),
              buildInvoiceInfo(invoice.info),
            ],
          ),
          // SizedBox(height: 1 * PdfPageFormat.cm),
        ],
      );

  static Widget buildCustomerAddress(Customer customer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(customer.order, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(customer.invoiceNumber,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Text(customer.paymentMethod,
              style: TextStyle(fontWeight: FontWeight.bold)),
          // Text(customer.totalItems,
          //     style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );

  static Widget buildInvoiceInfo(InvoiceInfo info) {
    // final paymentTerms = '${info.orderDate.difference(info.invoiceDate).inDays} days';
    final titles = <String>[
      'Order Date: ',
      'Invoice Date: ',
      'OrderStatus: ',
      'PaymentStatus: ',
    ];
    final data = <String>[
      Utils.formatDate(info.invoiceDate),
      // paymentTerms,
      Utils.formatDate(info.orderDate),
      info.orderStatus,
      info.paymentStatus,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];
        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  static Widget buildSupplierAddress(SupplierNrs suppliernrs) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(suppliernrs.name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(suppliernrs.email,
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(suppliernrs.address,
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(suppliernrs.mobile,
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(suppliernrs.pin, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );

  /* static Widget buildTitle(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INVOICE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(invoice.info.description),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );*/

  static Widget buildInvoice(InvoiceNrs invoice) {
    final headers = [
      'Description',
      // 'Date',
      'Quantity',
      'Unit Price',
      'GST',
      'Total'
    ];
    final data = invoice.items.map((item) {
      //final total = item.unitPrice * item.quantity * (1 + item.vat);

      return [
        item.description,
        // Utils.formatDate(item.date),
        '${item.quantity}',
        //'${_invoiceController.getinvoidelist!.result![0].totalItem.toString()}',
        '${item.unitPrice}',
        '${item.vat}%',
        '${item.total.toStringAsFixed(2)}',
        //'${_invoiceController.getinvoidelist!.result![0].price.toString()}',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.center,
        2: Alignment.center,
        3: Alignment.center,
        4: Alignment.center,
        5: Alignment.center,
      },
    );
  }

  static Widget buildTotal() {
    final netTotal =
        _invoicenrsController.getnurseinvoice?.finalamount?.toDouble();
    // invoice.items
    //     .map((item) => item.unitPrice * item.quantity)
    //     .reduce((item1, item2) => item1 + item2);
    final vatPercent = _invoicenrsController.getnurseinvoice?.gst?.toDouble();
    //invoice.items.first.vat;
    final vat = _invoicenrsController.getnurseinvoice?.gst?.toDouble();
    //double.parse(
    //"${(_invoiceController.getmedicineinvoice?.grandTotal?.toDouble())! * ((_invoiceController.getmedicineinvoice!.gst!.toDouble())! / 100).toDouble()}");
    //        "${(_medicinecheckoutController.medicinecheckoutModel?.data?.totalPrice?.toDouble())! * ((_medicinecheckoutController.medicinecheckoutModel?.data?.gst?.toDouble())! / 100).toDouble()}");
    ///final vat = netTotal * vatPercent ;
    // 100;
    final total = _invoicenrsController.getnurseinvoice!.grandTotal!.toDouble();
    //netTotal + vat;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net total:',
                  value:
                      "${_invoicenrsController.getnurseinvoice?.finalamount?.toDouble()}",

                  // value: Utils.formatPrice(),
                  unite: true,
                ),
                buildText(
                  title: 'Gst:',
                  //'${_invoiceController.getmedicineinvoice?.gst} %',
                  value:
                      "${_invoicenrsController.getnurseinvoice?.gstAmount?.toDouble()}",
                  unite: true,
                ),
                // buildText(
                //   title: 'Delivery Charge:',
                //   //'${_invoiceController.getmedicineinvoice?.gst} %',
                //   value:
                //       "${_invoicenrsController.getnurseinvoice?.deliveryCharge?.toDouble()}",
                //   unite: true,
                // ),
                Divider(),
                buildText(
                  title: 'Grand Total:',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value:
                      "${_invoicenrsController.getnurseinvoice?.grandTotal?.toDouble()}",

                  //value: Utils.formatPrice(total),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(InvoiceNrs invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Return Policy: ',
              value: invoice.suppliernrs.returnPolicy),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Regd. office PsDr: ', value: invoice.suppliernrs.office),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return pw.RichText(
        text: pw.TextSpan(children: [
      pw.TextSpan(text: title, style: style),
      pw.TextSpan(
        text: value,
      ),
    ]));
    /*  Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );*/
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: style),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
