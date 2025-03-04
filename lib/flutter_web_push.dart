library;

import 'dart:html' as html;
import 'dart:js_util' as js_util;

class FlutterWebPush {
  static FlutterWebPush? _instance;
  late html.ServiceWorkerRegistration _swRegistration;

  FlutterWebPush._();

  static Future<FlutterWebPush> initialize(String serviceWorkerPath) async {
    if (_instance != null) return _instance!;

    final registration = await html.window.navigator.serviceWorker?.register(
      serviceWorkerPath,
    );
    if (registration == null) {
      throw Exception(
        "Service Worker не поддерживается или регистрация не удалась.",
      );
    }

    _instance = FlutterWebPush._();
    _instance!._swRegistration = registration;
    return _instance!;
  }

  Future<html.PushSubscription?> subscribe(String vapidKey) async {
    final permission = await html.Notification.requestPermission();
    if (permission != 'granted') {
      throw Exception("Уведомления не разрешены пользователем.");
    }

    final options = js_util.jsify({
      "userVisibleOnly": true,
      "applicationServerKey": vapidKey,
    });

    final subscription = await js_util.promiseToFuture<html.PushSubscription?>(
      js_util.callMethod(_swRegistration.pushManager as Object, 'subscribe', [
        options,
      ]),
    );

    return subscription;
  }

  Future<void> unsubscribe() async {
    final subscription = await _swRegistration.pushManager?.getSubscription();
    await subscription?.unsubscribe();
  }

  Future<html.PushSubscription?> getSubscription() async {
    return await _swRegistration.pushManager?.getSubscription();
  }
}
