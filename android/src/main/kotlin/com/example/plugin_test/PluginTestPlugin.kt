package com.example.plugin_test

import android.util.Log
import androidx.annotation.NonNull
import com.example.plugin_test.map.EchoMapFactory
import com.example.plugin_test.util.utilPlugin

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** PluginTestPlugin */
class PluginTestPlugin: FlutterPlugin, MethodCallHandler,ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel



  //FlutterPlugin的方法
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugin_test")
    channel.setMethodCallHandler(this)

    val  util_channel =  MethodChannel(flutterPluginBinding.binaryMessenger,"util")
    util_channel.setMethodCallHandler(utilPlugin())

    flutterPluginBinding.platformViewRegistry.registerViewFactory("mapView",EchoMapFactory())


  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
      //安卓平台向flutter端发送数据
      var map = mapOf("message" to 1.8)
      channel.invokeMethod("toFlutter",map)

    } else if(call.method == ""){
      result.success("calculateLineDistance")
    }else {
      result.notImplemented()
    }
  }

  //FlutterPlugin的方法
  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  //通过ActivityAware监听生命周期
  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    Log.i("1","onAttachedToActivity")
  }

  override fun onDetachedFromActivityForConfigChanges() {
    Log.i("2","onDetachedFromActivityForConfigChanges")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    Log.i("3","onReattachedToActivityForConfigChanges")
  }

  override fun onDetachedFromActivity() {
    Log.i("4","onDetachedFromActivity")
  }
}
