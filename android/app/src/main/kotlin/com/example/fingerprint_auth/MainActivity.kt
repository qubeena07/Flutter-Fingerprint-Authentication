package com.example.fingerprint_auth

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine:FlutterEngine){
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
