package com.example.plugin_test.map

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


public  class EchoMapFactory: PlatformViewFactory(StandardMessageCodec.INSTANCE) {


    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
//        val params = args as Map<String, Any>
        return  EchoMapView(context = context)
    }
}