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
  ///@title calculateLineDistance
  ///@description TODO  计算两个点位的经纬度
  ///@return: Future<String?>
  ///@updateTime 2023/3/31 15:07
  ///@author xxx
  Future<String?> calculateLineDistance(double lng1,double lat1,double lng2,double lat2) async {

    final version = await methodChannel.invokeMethod<String>('calculateLineDistance',[
      lng1,lat1,lng2,lat2
    ]);
    return version;
  }

  ///@title calculateLineDistanceByAmap
  ///@description TODO 通过高德地图计算距离
  ///@param: lng1
  ///@param: lat1
  ///@param: lng2
  ///@param: lat2
  ///@return: Future<String?>
  ///@updateTime 2023/3/31 15:50
  ///@author LinGuanYu
  Future<String?> calculateLineDistanceByAmap(double lng1,double lat1,double lng2,double lat2) async {
    final version = await methodChannel.invokeMethod<String>('calculateLineDistanceByAmap',[
      lng1,lat1,lng2,lat2
    ]);

    return version;
  }
}