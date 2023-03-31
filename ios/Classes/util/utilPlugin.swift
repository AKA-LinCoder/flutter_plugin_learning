//
//  utilPlugin.swift
//  plugin_test
//
//  Created by Estim on 2023/3/31.
//
import Flutter
import Foundation
var utilChannel:FlutterMethodChannel?
public class utilPlugin: NSObject, FlutterPlugin{

    public static func register(with registrar: FlutterPluginRegistrar) {
        utilChannel = FlutterMethodChannel(name: "util", binaryMessenger: registrar.messenger())
        let instance = utilPlugin()
        if(utilChannel != nil){
            registrar.addMethodCallDelegate(instance, channel: utilChannel!)
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        ///应该在这里进行方法名的判断然后在根据不同方法名
       if(call.method == "fuckYou"){
           result("we fuck off!!")
       }

    }


}
