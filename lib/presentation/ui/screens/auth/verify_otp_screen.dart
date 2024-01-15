import 'dart:async';
import 'package:cafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:cafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:cafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class VerifyOtpScreen extends StatefulWidget {
  VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {

  final otpTimer = const Duration(seconds: 1);
  int otpCount = 120;

  void otpCountDown() {
    Timer.periodic(otpTimer, (timer) {
      if (otpCount == 0) {
        timer.cancel();
      }
      otpCount--;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    otpCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
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
                "Enter OTP Code",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "A 4 digits OTP code has been sent",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 16),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                pinTheme: PinTheme(
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
                appContext: context,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {
                    Get.to(const CompleteProfileScreen());
                  }, child: Text("Next"))),
            const SizedBox(height: 16),
            Visibility(
                visible: otpCount > 0,
                replacement: Text(
                  "OTP Validation Expired!",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.red,
                  ),
                ), child:
            RichText(
                text:
                TextSpan(style: TextStyle(color: Colors.grey), children: [
                  TextSpan(text: 'This Code Will Expire on '),

                  TextSpan(
                      text: '${otpCount}s',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                ])),
            ),


              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend Code",
                    style: TextStyle(color: Colors.grey),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
