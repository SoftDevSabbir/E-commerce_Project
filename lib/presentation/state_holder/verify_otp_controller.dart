
import 'package:cafty_bay/presentation/state_holder/read_profile_data_controller.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';
import 'auth_controller.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String _token = '';

  String get token => _token;

  Future<bool> verifyOTP(String email, String otp) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
   // update();

    if (response.isSuccess) {
      _token = response.responseData['data'];
      await Future.delayed(const Duration(seconds: 2));
      final result =
      await Get.find<ReadProfileDataController>().readProfileData(token);
      if (result) {
        _shouldNavigateCompleteProfile = Get.find<ReadProfileDataController>().isProfileCompleted == false;
       // Get.find<AuthController>().saveUserDetails(token,);
       // await Get.to(CompleteProfileScreen());
        if (_shouldNavigateCompleteProfile == false) {
          await Get.find<AuthController>().saveUserDetails(token, Get.find<ReadProfileDataController>().profile);
        }
      } else {
        _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}