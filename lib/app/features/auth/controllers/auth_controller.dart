import 'package:cs_100/app/routes/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  late GetStorage userDetailsBox;
  final userStore = GetStorage('userStore');
  RxBool isLoading = false.obs;
  var isSignIn = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
        userStore.write('id', _auth.currentUser!.uid);
        userDetailsBox = GetStorage(_auth.currentUser!.uid);
        final details = userDetailsBox.read('userDetails');
        if (details == null) {
          Get.offAllNamed(AppRoutes.userDetails);
        } else {
          Get.offAllNamed(
            AppRoutes.home,
          );
        }
      }
    } on PlatformException {
      Get.snackbar(
        'Error',
        'PlatformException',
        backgroundColor: Get.theme.colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Get.theme.colorScheme.error,
      );
      return;
    } on FirebaseAuthException {
      Get.snackbar(
        'Error',
        'An error occurred while signing in, please try again',
        backgroundColor: Get.theme.colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Get.theme.colorScheme.error,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Authentication failed, please try again',
        backgroundColor: Get.theme.colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Get.theme.colorScheme.error,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    isLoading.value = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      userStore.write('id', credential.user?.uid);
      userDetailsBox = GetStorage(credential.user!.uid);
      final details = userDetailsBox.read('userDetails');
      if (details == null) {
        Get.offAllNamed(AppRoutes.userDetails);
      } else {
        Get.offAllNamed(
          AppRoutes.home,
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
