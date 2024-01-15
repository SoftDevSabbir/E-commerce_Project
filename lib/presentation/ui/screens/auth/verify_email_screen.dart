import 'package:cafty_bay/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:cafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Welcome back",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 4,),
                Text(
                  "Please Enter Your Email Address",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: "Email"),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      Get.off(VerifyOtpScreen());
                    }, child: Text("Next")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
