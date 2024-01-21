import 'package:cafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:cafty_bay/presentation/state_holder/complete_profile_controller.dart';
import 'package:cafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:cafty_bay/presentation/state_holder/read_profile_data_controller.dart';
import 'package:cafty_bay/presentation/state_holder/send_email_otp_controller.dart';
import 'package:cafty_bay/presentation/state_holder/verify_otp_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOTPController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
}

}
