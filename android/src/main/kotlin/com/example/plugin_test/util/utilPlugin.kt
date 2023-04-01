package com.example.plugin_test.util

import android.location.Location
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result

class utilPlugin:FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var utilChannel: MethodChannel
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        utilChannel = MethodChannel(binding.binaryMessenger,"util")
        utilChannel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        utilChannel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if(call.method == "calculateLineDistance"){
            val  argument = call.arguments as List<Double>
            calculateLineDistance(lat1 = argument[1], lng1 = argument[0], lat2 = argument[3], lng2 = argument[2],result)
        }else if(call.method == "fuckYou"){
            result.success("fuck you")
        }else{
            result.success("fuck me")
        }
    }

    fun calculateLineDistance(lat1:Double,lng1:Double,lat2:Double,lng2:Double,@NonNull result: Result){
        val location1 = Location("")
        location1.latitude = lat1
        location1.longitude = lng1
        val location2 = Location("")
        location2.latitude = lat2
        location2.longitude = lng2
        result.success(location1.distanceTo(location2).toString())
    }
}