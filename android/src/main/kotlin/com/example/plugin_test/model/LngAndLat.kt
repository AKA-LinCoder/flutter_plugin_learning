package com.example.plugin_test.model

data class LngAndLat ( val longitude:Double,val latitude:Double)

sealed class PluginMethod {
    object calculateLineDistance:PluginMethod()
    object fuckYou:PluginMethod()

    object unKown:PluginMethod()
}