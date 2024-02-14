import 'package:cafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:cafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:cafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final authController = Get.find<AuthController>();
  late Map<String, dynamic> userData = {
    'name': authController.readProfile?.cusName ??
        authController.completeProfile?.cusName,
    'id': authController.readProfile?.userId ??
        authController.completeProfile?.userId,
    'address': authController.readProfile?.cusAdd ??
        authController.completeProfile?.cusAdd,
    'phone': authController.readProfile?.cusPhone ??
        authController.completeProfile?.cusPhone,
    'shipAdd': authController.readProfile?.shipAdd ??
        authController.completeProfile?.shipAdd,
  };
  late bool response = authController.readProfile != null;
  late bool response2 = authController.completeProfile != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ),
      body: Builder(builder: (context) {
        if (response == false && response2 == false) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock,
                    color: Colors.grey,
                    size: 140,
                  ),
                  const Text(
                    "Welcome dear",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text(
                      "It's Look Like You Are Not Logged In User!!!",
                      style: TextStyle(
                          fontSize: 25, color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => VerifyEmailScreen());
                          },
                          child: const Text(
                            "Login / Sign Up",
                            style: TextStyle(fontSize: 20),
                          ))),
                ],
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 70, right: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                  child: Icon(
                Icons.verified_user_sharp,
                size: 190,
                color: AppColors.primaryColor,
              )),
              const SizedBox(height: 5),
              Text(
                "Name: ${userData['name']}",
                style: const TextStyle(fontSize: 25),
              ),
              const Divider(color: AppColors.primaryColor),
              const SizedBox(
                height: 5,
              ),
              Text("User Id:${userData['id']}",
                  style: const TextStyle(fontSize: 25)),
              const Divider(color: AppColors.primaryColor),
              const SizedBox(
                height: 5,
              ),
              Text("Address: ${userData['address']}",
                  style: const TextStyle(fontSize: 25)),
              const Divider(color: AppColors.primaryColor),
              const SizedBox(
                height: 5,
              ),
              Text("Phone: ${userData['phone']}",
                  style: const TextStyle(fontSize: 25)),
              const Divider(color: AppColors.primaryColor),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Shiping Address: ${userData['shipAdd']}",
                style: const TextStyle(fontSize: 25),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const Divider(color: AppColors.primaryColor),
            ],
          ),
        );
      }),
    );
  }
}
