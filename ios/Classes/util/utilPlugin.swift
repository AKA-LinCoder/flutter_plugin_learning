//
//  utilPlugin.swift
//  plugin_test
//
//  Created by Estim on 2023/3/31.
//
import Flutter
import Foundation
import AMapFoundationKit
import AMapLocationKit
import CoreLocation
import MAMapKit
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
           result("fuck you")
       }else if(call.method == "calculateLineDistance"){
           var  data :[Double] = call.arguments as! [Double];
           self.calculateLineDistance(lngAndLat1: lngAndLat(longitude: data[0], latitude: data[1]), lngAndLat2: lngAndLat(longitude:data[2], latitude:  data[3]), result: result)
       }else if(call.method == "calculateLineDistanceByAmap"){
           var  data :[Double] = call.arguments as! [Double];
           self.calculateLineDistanceByAmap(lngAndLat1: lngAndLat(longitude: data[0], latitude: data[1]), lngAndLat2: lngAndLat(longitude:data[2], latitude:  data[3]), result: result)
       }

    }
    
    //MARK - 通过CoreLocation计算两点的经纬度
     func calculateLineDistance(lngAndLat1:lngAndLat,lngAndLat2:lngAndLat ,result: @escaping FlutterResult){
         let location1 = CLLocation(latitude: lngAndLat1.latitude, longitude: lngAndLat1.longitude)
         let location2 = CLLocation(latitude: lngAndLat2.latitude, longitude: lngAndLat2.longitude)
    
         let distance = location1.distance(from: location2)
         result("\(distance)")
    }
    
    //MARK - 通过高德地图计算距离
    func calculateLineDistanceByAmap(lngAndLat1:lngAndLat,lngAndLat2:lngAndLat ,result: @escaping FlutterResult){
        let coordinate1 = CLLocationCoordinate2D(latitude: lngAndLat1.latitude, longitude: lngAndLat1.longitude)
        let coordinate2 = CLLocationCoordinate2D(latitude: lngAndLat2.latitude, longitude: lngAndLat2.longitude)
        let distance = MAMetersBetweenMapPoints(MAMapPointForCoordinate(coordinate1), MAMapPointForCoordinate(coordinate2))
        result("\(distance)") // 输出两个经纬度之间的距离，单位为米
        
   }
    
    
    
    
    


}
