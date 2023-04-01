package com.example.plugin_test.extension

import com.example.plugin_test.model.PluginMethod


fun String.toPluginMethod(): PluginMethod {
    return  when(this){
        "calculateLineDistance" ->PluginMethod.calculateLineDistance
        "fuckYou" -> PluginMethod.fuckYou
        "calculateLineDistanceByAmap" -> PluginMethod.calculateLineDistanceByAmap
        else -> PluginMethod.unKown
    }
}