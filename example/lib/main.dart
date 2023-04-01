import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plugin_test/plugin_test.dart';
import 'package:plugin_test/util/util_method_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _pluginTestPlugin = PluginTest();
  final _utilPlugin = util_method_channel();
  String answer = "";
  String distance = "";
  String distance2 = "";
  late double centerPointLatitude; // 中心点 维度

  late double centerPointLongitude; // 中心点 经度

  bool hasPermission = false;

  @override
  void initState() {
    super.initState();

    initPlatformState();

  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
   print(await Permission.location.status);
    print( await Permission.locationAlways.status);
    print(await Permission.locationWhenInUse.status);
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      SystemChannels.platform.invokeMethod('setLogLevel', {'level': 'VERBOSE'});
      platformVersion =
          await _pluginTestPlugin.getPlatformVersion() ?? 'Unknown platform version';
      answer = await _utilPlugin.fuckYou()??"error";
      distance = await _utilPlugin.calculateLineDistance(103.822956,30.066668,104.190556,30.812500)??"error";

      distance2 = await _utilPlugin.calculateLineDistanceByAmap(103.822956,30.066668,104.190556,30.812500)??"error";
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('来自输出$answer'),
              Text("原生计算距离:$distance"),
              Text("高德计算距离:$distance2"),
              ElevatedButton(onPressed: ()async{
                await Permission.location.request();
                setState(() {
                  getPermission();
                  initPlatformState();
                });
              }, child: const Text("请求权限"))
            ],
          ),
        ),
      ),
    );
  }

  // 请求权限
  void getPermission() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      Permission permission = Permission.location;
      PermissionStatus permission_location = await permission.status;
      PermissionStatus permission_photos = await Permission.photos.status;
      PermissionStatus permission_storage = await Permission.storage.status;

      if (permission_location != PermissionStatus.granted ||
          permission_photos != PermissionStatus.granted ||
          permission_storage != PermissionStatus.granted) {
        List<Permission> permissions = <Permission>[
          Permission.location,
          Permission.phone,
          Permission.storage
        ];
        await Permission.location.request();
        await Permission.photos.request();
        await Permission.storage.request();
        PermissionStatus locationStatus =
        await Permission.location.status;
        PermissionStatus phoneStatus =
        await Permission.photos.status;
        PermissionStatus storageStatus =
        await Permission.storage.status;

        if (locationStatus == PermissionStatus.granted &&
            // phoneStatus == PermissionStatus.granted &&
            storageStatus == PermissionStatus.granted) {
          print('请求权限成功');
          setState(() {
            hasPermission = true;
          });
        } else {
          print('请求权限失败');
          print(phoneStatus);
          print(storageStatus);
          print(locationStatus);
          setState(() {
            hasPermission = false;
          });
        }
      } else {
        setState(() {
          hasPermission = true;
        });
      }
    }
    else if (defaultTargetPlatform == TargetPlatform.iOS) {
      Permission permission = Permission.location;
      PermissionStatus permission_location = await permission.status;
      if (permission_location != PermissionStatus.granted) {
        print("准备请求权限");
        var res = await permission.request();
        print("结果$res");

        PermissionStatus locationStatus =  await permission.status;
        print(locationStatus);
        if (locationStatus == PermissionStatus.granted) {
          print('请求权限成功');
          setState(() {
            hasPermission = true;
          });
        } else {
          print('请求权限失败');
          setState(() {
            hasPermission = false;
          });
        }
      } else {
        setState(() {
          hasPermission = true;
        });
      }
    }
    initPlatformState();
  }
}
