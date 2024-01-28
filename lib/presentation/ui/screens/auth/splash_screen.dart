import 'package:cafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:cafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:cafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen()async{
    await Future.delayed(Duration(seconds: 1));
    // final bool isLoggedIn=await Get.find<AuthController>().isLoggedIn();
    // if(isLoggedIn){
      Get.offAll(const MainBottomNavScreen());
    // }else{
    //   Get.offAll( VerifyEmailScreen());
    // }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset(AssetPath.logo,width: 120,),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16,),
            Text("Verson 1.0"),
            SizedBox(height: 16,)
          ],
        ),
        ),
    );
  }
}
