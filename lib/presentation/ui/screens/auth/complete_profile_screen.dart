
import 'package:cafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:cafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

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
                  height: 48,
                ),
                AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text("Complete Profile",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 28)),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Get started with your details",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: "First Name"),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: "Last Name"),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: "Mobile"),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: "City"),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(hintText: "Shipping Address"),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.offAll(MainBottomNavScreen());
                        }, child: Text("Complete")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
