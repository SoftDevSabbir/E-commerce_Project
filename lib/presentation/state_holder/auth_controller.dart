

import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/complete_profile_model.dart';
import '../../data/models/readProfileModel.dart';
import '../ui/screens/auth/verify_email_screen.dart';

class AuthController extends GetxController {
  static String? token;
  ReadProfileModel? readProfile;
  CompleteProfileModel? completeProfile;


  Future<void> saveUserDetails(
      String t, ReadProfileModel? r, CompleteProfileModel? p) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', t);
    await sharedPreferences.setString('readProfile', jsonEncode(r?.toJson()));
    await sharedPreferences.setString(
        'completeProfile', jsonEncode(p?.toJson()));
    token = t;
    readProfile = r;
    completeProfile = p;
  }

  Future<void> initialize() async {
    token = await _getToken();
    readProfile = await _getProfile();
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  bool get isTokenNotNull => token != null;

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  Future<ReadProfileModel?> _getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? strProfile = sharedPreferences.getString('profile');
    if (strProfile == null) {
      return null;
    } else {
      return ReadProfileModel.fromJson(jsonDecode(strProfile));
    }
  }

  static Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
  }

  static Future<void> goToLogin() async {
    Get.to(() =>  VerifyEmailScreen());
  }
}