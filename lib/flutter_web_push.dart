@JS()
library flutter_web_push;

import 'dart:async';
import 'dart:convert';
import 'package:js/js.dart';

@JS('webPush.init')
external void jsInit(String serviceWorkerPath, String publicVapidKey);

@JS('webPush.subscribe')
external String jsSubscribe();

@JS('webPush.unsubscribe')
external bool jsUnsubscribe();

class FlutterWebPush {
  static Future<void> init(String serviceWorkerPath, String publicVapidKey) async {
    jsInit(serviceWorkerPath, publicVapidKey);
  }

  static Future<Map<String, dynamic>> subscribe() async {
    final jsonStr = jsSubscribe();
    return jsonDecode(jsonStr);
  }

  static Future<bool> unsubscribe() async {
    return jsUnsubscribe();
  }
}
