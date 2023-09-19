import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfNurseApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getExternalStorageDirectory();
    final file = File('${dir?.absolute.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    try {
      final url = file.path;
      //await OpenFile.open(url);
      final result = await OpenFile.open(url);

      //final result = await OpenFile.open(url, type: 'pdf');
      print("E3 ${result.message}");
    } catch (e) {
      print("OPEN E $e");
    }
  }
}