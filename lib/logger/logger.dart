import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Logger {
  static String TAG = 'Logger';

  static void d(String tag, message) {
    if (kReleaseMode) return;
    try {
      debugPrint('$TAG : $tag : $message');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static void e(message) {
    if (kReleaseMode) return;
    try {
      debugPrint('$TAG : ERROR : ${message.toString()}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
