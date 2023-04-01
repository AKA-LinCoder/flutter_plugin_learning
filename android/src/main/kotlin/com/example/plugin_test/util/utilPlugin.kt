package com.example.plugin_test.util

import android.location.Location
import androidx.annotation.NonNull
import com.example.plugin_test.extension.toPluginMethod
import com.example.plugin_test.model.LngAndLat
import com.example.plugin_test.model.PluginMethod
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
        when (call.method.toPluginMethod()) {
            is PluginMethod.calculateLineDistance->{
                val  argument = call.arguments as List<Double>
                val lngAndLat1 = LngAndLat(latitude = argument[1], longitude = argument[0])
                val lngAndLat2 = LngAndLat(latitude = argument[3], longitude = argument[2])
                calculateLineDistance( lngAndLat1 = lngAndLat1, lngAndLat2 = lngAndLat2, result = result)
            }
            is PluginMethod.fuckYou->{
                result.success("fuck you")
            }

            is PluginMethod.unKown ->{
                result.success("fuck me")
            }
        }
    }

    fun calculateLineDistance(lngAndLat1:LngAndLat,lngAndLat2:LngAndLat,@NonNull result: Result){
        val location1 = Location("")
        location1.latitude = lngAndLat1.latitude
        location1.longitude = lngAndLat1.longitude
        val location2 = Location("")
        location2.latitude = lngAndLat2.latitude
        location2.longitude = lngAndLat2.longitude
        result.success(location1.distanceTo(location2).toString())
    }
}