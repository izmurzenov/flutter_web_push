import 'dart:js' as js;

class FlutterWebPush {
  /// Инициализация Web Push
  static Future<void> initialize() async {
    js.context.callMethod('initializeWebPush');
  }

  /// Подписка на уведомления, возвращает subscription объект
  static Future<String?> subscribe() async {
    final subscription = js.context.callMethod('subscribeToPush');
    return subscription as String?;
  }

  /// Отписка от Web Push
  static Future<void> unsubscribe() async {
    js.context.callMethod('unsubscribeFromPush');
  }
}
