package com.example.plugin_test.map

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.Button
import io.flutter.plugin.platform.PlatformView

class EchoMapView(context: Context?): PlatformView {

    private val button = MyButton(context)
    override fun getView(): View? {
        return  button
    }

    override fun dispose() {
        TODO("Not yet implemented")
    }
}

class MyButton(context: Context?):Button(context){
    init {
        text = "this is a kotlin button"
        textSize = 24f
        setBackgroundColor(Color.YELLOW)
    }
}