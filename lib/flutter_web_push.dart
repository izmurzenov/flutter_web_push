import 'dart:js_interop';

@JS()
external void subscribeToPush();

class FlutterWebPush {
  static void subscribe() {
    subscribeToPush();
  }
}
