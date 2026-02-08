import 'package:cabme/core/app_initializer.dart';
import 'package:cabme/my_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  // Initialize all app dependencies
  await AppInitializer.initializeApp();

  // Run app with Device Preview in debug mode only
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable only in debug mode
      builder: (context) => const MyApp(),
    ),
  );
}
