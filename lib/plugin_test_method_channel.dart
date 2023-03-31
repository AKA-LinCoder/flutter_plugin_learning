import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_test_platform_interface.dart';

/// An implementation of [PluginTestPlatform] that uses method channels.
class MethodChannelPluginTest extends PluginTestPlatform {
  /// 'plugin_test' 获取原生平台对应的MethodChannel接口实现
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_test')..setMethodCallHandler((call){
    if(call.method=="toFlutter"){
      if (kDebugMode) {
        print("这是从原生平台获取到的信息${call.arguments["message"]}");
      }
    }
    return Future.value(true);
  }


  );

  ///获取原生平台中对应的版本信息
  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
