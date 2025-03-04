import 'dart:js_interop';

/// External JavaScript function to register for remote notifications.
@JS('subscribeToPush')
external JSPromise<JSString> _registerForRemoteNotification(
  final JSString vapidKey,
);

@override
Future<String> registerForRemoteNotification(String? vapidKey) async {
  // Registers for remote notifications using the VAPID key.
  if (vapidKey == null) {
    throw ArgumentError(
      'Vapid key must be specified when using native push on the web.',
    );
  }
  final success = await _registerForRemoteNotification(vapidKey.toJS).toDart;
  return success.toDart;
}
