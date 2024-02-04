import 'package:cafty_bay/presentation/state_holder/send_email_otp_controller.dart';
import 'package:cafty_bay/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:cafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regexed_validator/regexed_validator.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key});
  final TextEditingController _emailTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
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
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Please Enter Your Email Address",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (value) {
                      if (value == null || !validator.email(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder<SendEmailOtpController>(builder: (controller) {
                    return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: controller.inProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final bool result =
                                      await controller.sendOtpToEmail(
                                          _emailTEController.text.trim());
                                  if(result){
                                    Get.to(()=>VerifyOTPScreen(email:_emailTEController.text.trim()));
                                  }else{
                                    Get.showSnackbar(GetSnackBar(title: "Send Otp faild",
                                     message: controller.errorMessage,
                                      duration: Duration(seconds: 2),
                                      isDismissible: true,
                                    ));
                                  }
                                }
                              },
                              child: Text("Next")),
                        ));
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
