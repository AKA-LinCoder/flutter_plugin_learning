//
//  EchoMapView.swift
//  permission_handler_apple
//
//  Created by Estim on 2023/4/1.
//

import UIKit
import Flutter
class EchoMapView:NSObject, FlutterPlatformView{
    
    //懒加载
       private var videoView:UIView={
           let videoView=UIView()
           videoView.backgroundColor = .red
           return videoView
       }()
    
    

    
   
    
    func view() -> UIView {
        
        return videoView
    }
    
    
    
}
