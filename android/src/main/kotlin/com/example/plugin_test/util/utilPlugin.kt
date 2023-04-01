package com.example.plugin_test.util

import android.location.Location
import androidx.annotation.NonNull
import com.example.plugin_test.model.LngAndLat
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
        when (call.method) {
            "calculateLineDistance"->{
                val  argument = call.arguments as List<Double>
                calculateLineDistance( lngAndLat1 = LngAndLat(latitude = argument[1], longitude = argument[0]),
                   lngAndLat2 = LngAndLat(latitude = argument[3], longitude = argument[2]), result = result)
            }
            "fuckYou"->{
                result.success("fuck you")
            }
            else ->{
                result.success("fuck me")
            }
        }
    }

    fun calculateLineDistance(lngAndLat1:LngAndLat,lngAndLat2:LngAndLat,@NonNull result: Result){

//    fun calculateLineDistance(lat1:Double,lng1:Double,lat2:Double,lng2:Double,@NonNull result: Result){
        val location1 = Location("")
        location1.latitude = lngAndLat1.latitude
        location1.longitude = lngAndLat1.longitude
        val location2 = Location("")
        location2.latitude = lngAndLat2.latitude
        location2.longitude = lngAndLat2.longitude
        result.success(location1.distanceTo(location2).toString())
    }
}