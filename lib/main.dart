import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/features/authentication/screen/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/theme/theme.dart';

void main() {
  // runApp(const MainApp());
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(), // Wrap your app
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "SysQube Ecommerce",
      debugShowCheckedModeBanner: false,
      theme: SQAppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
