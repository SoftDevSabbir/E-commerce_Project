import 'package:cafty_bay/presentation/ui/screens/auth/splash_screen.dart';
import 'package:cafty_bay/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'controller_binder.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme:AppThemeData.lightThemeData,
      initialBinding: ControllerBinder(),
    );
  }
}

