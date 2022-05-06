import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../modules/screens/OTP/otp_view_controller.dart';
import '../routes/app_pages.dart';

class AuthServiceController extends GetxController {
  final FirebaseAuth _authInstence = FirebaseAuth.instance;

  String get getUid => _authInstence.currentUser!.uid;
  String get getPhoneNumber => _authInstence.currentUser!.phoneNumber!;

  // late Map<String, String?> currentUser;

  late Rx<User?> firebaseUser;
  var isLoadig = false.obs;
  var isLoadingGetIn = false.obs;
  String _verificationCode = '';

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_authInstence.currentUser);
    firebaseUser.bindStream(_authInstence.userChanges());

    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  void _setInitialScreen(User? user) async {
    if (user != null) {
      Get.offAllNamed(Routes.DRAWER);
      isLoadingGetIn.value = false;
    } else {
      Get.offAllNamed(Routes.OTP_VIEW);
    }
  }

  // void signUp(String email, String password) async {
  //   isLoadig(true);
  //   await _authInstence.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   isLoadig(false);
  // }

  Future<void> phoneLogIn(String phoneNo) async {
    try {
      await _authInstence.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _authInstence.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          // customBar(message: e.message.toString(), title: 'Error');
          log("Verification Failed Exception : $e");
          isLoadig.value = false;
          Get.find<OtpViewController>().showResendButton.value = true;
        },
        codeSent: (String verificationId, int? resendToken) async {
          _verificationCode = verificationId;
          isLoadig.value = false;
          Get.find<OtpViewController>().showResendButton.value = true;
          // Get.toNamed(Routes.OTP, arguments: phoneNo);
          Get.find<OtpViewController>().startCountDown();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          //! Not sure if it is working.
          isLoadig.value = false;
          if (firebaseUser.value == null) {
            Get.find<OtpViewController>().showResendButton.value = true;
          }

          _verificationCode = verificationId;
        },
        timeout: const Duration(seconds: 45),
      );
    } on FirebaseAuthException catch (e) {
      isLoadig.value = false;
      log("Send OTP exception : $e");
    }
  }

  Future<bool> submitOtp({
    required String pin,
    required BuildContext ctx,
  }) async {
    try {
      // FocusScope.of(ctx).unfocus();
      await _authInstence.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: _verificationCode,
          smsCode: pin,
        ),
      );
      // isLoadingGetIn.value = false;
      isLoadig.value = false;
      return false;
    } on FirebaseAuthException catch (e) {
      // FocusScope.of(ctx).unfocus();
      isLoadig.value = false;
      isLoadingGetIn.value = false;
      log("Submit OTP exception : $e");
      // customBar(  runApp(
      // );
      Fluttertoast.showToast(msg: "Invalid OTP please recheck");
      // Get.snackbar("Error", e.message.toString());
      return true;
    }
  }

  void logOut() => _authInstence.signOut();

  // Map<String, String?> getCurrentUserInfo() {
  //   User? user = _authInstence.currentUser;
  //   Map<String, String?> currentUserInfo = {
  //     'uid': user?.uid,
  //     'phoneNumber': user?.phoneNumber,
  //   };
  //   return currentUserInfo;
  // }
}
