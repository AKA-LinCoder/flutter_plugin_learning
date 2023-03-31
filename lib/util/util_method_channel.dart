import 'package:flutter/services.dart';

/// FileName util_method_channel
///
/// @Author LinGuanYu
/// @Date 2023/3/31 09:49
///
/// @Description TODO

class util_method_channel{
  final methodChannel = const MethodChannel('util');


  Future<String?> fuckYou() async {
    final version = await methodChannel.invokeMethod<String>('fuckYou');
    return version;
  }
}