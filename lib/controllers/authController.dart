import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  TextEditingController emailController,
      passwordController,
      nameController,
      phoneController;

  var email = '';
  var password = '';
  var phone = '';
  var name = '';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Fournissez une adresse e-mail valide";
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return "Le mot de passe doit être superieur de 6 caractères";
    }
    return null;
  }

  String validateName(String value) {
    if (value.length < 6) {
      return "Fournissez votre nom et prénom";
    }
    return null;
  }

  String validatePhone(String value) {
    if (value.length < 10) {
      return "Le numéro de téléphone doit être supérieur à 10";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState.reset();
    Get.offAllNamed("/home");
  }

  void checkSignup() {
    final isValid = signupFormKey.currentState.validate();
    if (!isValid) {
      return;
    }
    signupFormKey.currentState.reset();
    Get.offNamed("/confirmation");
  }
}
