import 'package:ecommerce/features/authentication/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SysQube Ecommerce",
      debugShowCheckedModeBanner: false,
      theme: SQAppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
