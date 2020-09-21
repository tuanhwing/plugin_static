import 'dart:async';

import 'package:flutter/services.dart';

typedef void Listener(dynamic msg);
typedef void CancelListening();

class PluginExample {
  static const MethodChannel _channel =
      const MethodChannel('PluginDemo');
  static const EventChannel _events = const EventChannel('PluginStream');

  final Stream<dynamic> stream = _events.receiveBroadcastStream();

  PluginExample._privateConstructor();

  static final PluginExample _instance = PluginExample._privateConstructor();

  factory PluginExample() {
    return _instance;
  }


  Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<dynamic> showNative(Map<String, String> params) async {
    return _channel.invokeMethod('showNative', params);
  }

  //Stream
  StreamSubscription startListening(Listener listener) {

    var subscription = stream.listen(listener, cancelOnError: true);
    return subscription;
  }

}
