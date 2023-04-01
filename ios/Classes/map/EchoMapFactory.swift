//
//  EchoMapFactory.swift
//  permission_handler_apple
//
//  Created by Estim on 2023/4/1.
//

import Flutter
public class EchoMapFactory:NSObject,FlutterPlatformViewFactory{
   
    private var registrar:FlutterPluginRegistrar
     init(registrar: FlutterPluginRegistrar) {
         self.registrar = registrar
         super.init()
     }
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return EchoMapView()
    }
     //这个方法一定要写，否则接受不到flutter的传参
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
             return FlutterStandardMessageCodec.sharedInstance()
         }
    
   
    
}
