import Flutter
import UIKit
var channel:FlutterMethodChannel?
public class PluginTestPlugin: NSObject, FlutterPlugin {
     
  public static func register(with registrar: FlutterPluginRegistrar) {
    channel = FlutterMethodChannel(name: "plugin_test", binaryMessenger: registrar.messenger())
    let instance = PluginTestPlugin()
      if(channel != nil){
          registrar.addMethodCallDelegate(instance, channel: channel!)
      }
   
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
    //iOS端向flutter发送数据
      var iosMap:[String:String] = ["message":"我是苹果平台"]
      channel?.invokeMethod("toFlutter",arguments:iosMap)

  }
}
