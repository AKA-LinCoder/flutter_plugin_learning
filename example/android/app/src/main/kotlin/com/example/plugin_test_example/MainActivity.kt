package com.example.plugin_test_example

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.os.Debug
import android.util.Log
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    companion object {
        const val TAG = "安卓日志"
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (BuildConfig.DEBUG) {
            Log.d(TAG, "Debug mode enabled")
            Log.d(TAG, "Build type: " + BuildConfig.BUILD_TYPE)
//            Log.d(TAG, "Flavor: " + BuildConfig.FLAVOR)
            Log.d(TAG, "Version code: " + BuildConfig.VERSION_CODE)
            Log.d(TAG, "Version name: " + BuildConfig.VERSION_NAME)
            Log.d(TAG, "Application ID: " + BuildConfig.APPLICATION_ID)
            // 开启调试模式
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                Log.d("MyPlugin", "Enabling debug mode for Android P or later")
                val packageName = packageName
                Debug.getNativeHeapAllocatedSize()

                Log.d(TAG, "Native heap stats:")
                Log.d(TAG, "  Size: " + Debug.getNativeHeapAllocatedSize())
                Log.d(TAG, "  Allocated: " + Debug.getNativeHeapAllocatedSize())
                Log.d(TAG, "  Free: " + Debug.getNativeHeapFreeSize())
                if (checkSelfPermission(Manifest.permission.READ_LOGS) !== PackageManager.PERMISSION_GRANTED) {
                    Log.d(TAG, "Requesting READ_LOGS permission")
                    requestPermissions(arrayOf<String>(Manifest.permission.READ_LOGS), 123)
                } else {
                    Log.d(TAG, "READ_LOGS permission already granted")
                    Log.d(TAG, "Starting Logcat service")
                    val intent = Intent(context, LogcatService::class.java).apply {
                        action = LogcatService.ACTION_START // 指定 action 为 ACTION_START
                        putExtra(LogcatService.EXTRA_BUFFER_SIZE, 1024) // 指定缓冲区大小
                    }
                    context.startService(intent) // 启动服务
                }
            } else {
                Log.d(TAG, "Enabling debug mode for Android O or earlier")
                Log.d(TAG, "Starting Logcat service")
                val intent = Intent(context, LogcatService::class.java).apply {
                    action = LogcatService.ACTION_START // 指定 action 为 ACTION_START
                    putExtra(LogcatService.EXTRA_BUFFER_SIZE, 1024) // 指定缓冲区大小
                }
                context.startService(intent) // 启动服务
            }
        }
    }
}
