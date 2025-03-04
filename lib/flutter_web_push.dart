import 'dart:js_interop';

@JS('subscribeToPushWrapper')
external JSObject _subscribeToPush();

Future<Object?> subscribeToPush() async {
  final jsObject = _subscribeToPush();
  return jsObject as Object?;
}