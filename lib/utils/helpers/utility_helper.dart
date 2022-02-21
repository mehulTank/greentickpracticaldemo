import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:greentickpracticaldemo/utils/helpers/globals.dart' as globals;

//created on 25/09/2021
//purpose : to provide different utility help methods
class UtilityHelper {
  String dateFormatddmmyyyy = 'dd/MM/yyyy';
  String dateDashedFormatddmmyyyy = 'dd-MM-yyyy';

  static void showLog(String key, String value) {
    // ignore: avoid_print
    print('$key : $value');
  }

  static Future<bool> checkInternet() async {
    try {
      final ConnectivityResult connectivityResult =
          await Connectivity().checkConnectivity();
      final bool result = connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi;
      return result;
    } on SocketException catch (_) {
      return false;
    }
  }

  static String getDateInFormat(DateTime date) {
    var difference = DateTime.now().difference(date).inDays;
    if (difference < 1) {
      return "Today";
    } else if (difference < 2) {
      return "Yesterday";
    } else {
      return DateFormat("yyyy-MM-dd").format(date);
    }
  }

  /// Created by Dev 2301 on 10/6/2021
  /// Modified by Dev 2301 on 10/6/2021
  /// Purpose : date picker
  Future<DateTime?> selectDate(
      BuildContext context, DateTime initialDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
  }

  ///format date as per given format
  String getFormattedDate(String? date, {String? format}) {
    if (date != null) {
      try {
        final parsedDate = DateTime.parse(date);
        final formattedDate =
            DateFormat(format ?? dateFormatddmmyyyy).format(parsedDate);
        print(formattedDate);
        return formattedDate;
      } on Exception catch (e) {
        print("exception in  getFormattedDate: $e");
        return date;
      }
    }
    return "";
  }

  /// Created by Dev 2301 on 10/12/2021
  /// Modified by Dev 2301 on 10/12/2021
  /// Purpose : prepare pdf file from given byte data
  Future<File> preparePdfFile(Uint8List data) async {
    var filename = '';
    var uuid = Uuid();
    if (globals.mimeType.contains('text/csv') ||
        globals.mimeType.contains(
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')) {
      filename = globals.mimeType.contains('text/csv')
          ? "INV_${uuid.v4()}.csv"
          : "INV_${uuid.v4()}.xlsx";
    } else {
      filename = "INV_${uuid.v4()}.pdf";
    }

    //filename = "INV_${uuid.v4()}.pdf";
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(data);
    print("file path: " + file.path);
    return file;
  }
}
