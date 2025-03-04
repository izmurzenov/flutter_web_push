import 'dart:js_util';
import 'dart:js';

class WebPush {
  static Future<dynamic> subscribe() async {
    final promise = context.callMethod('subscribeToPush');
    return await promiseToFuture(promise);
  }
}
