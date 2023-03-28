import 'package:flutter/material.dart';
import 'package:flutter_auth/helper/binding.dart';
import 'package:flutter_auth/views/cartView.dart';
import 'package:flutter_auth/views/confirmation_model.dart';
import 'package:flutter_auth/views/detailsView.dart';
import 'package:flutter_auth/views/home_screen.dart';
import 'package:flutter_auth/views/login_screen.dart';
import 'package:flutter_auth/views/product_screen.dart';
import 'package:flutter_auth/views/signup_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    initialBinding: HomeBinding(),
    getPages: [
      GetPage(
          name: "/",
          page: () => HomeScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/home",
          page: () => HomeScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/login",
          page: () => LoginScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/signup",
          page: () => SignUpScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/confirmation",
          page: () => Confirmation(),
          transition: Transition.cupertino),
      GetPage(
          name: "/products",
          page: () => ProductView(),
          transition: Transition.cupertino),
      GetPage(
          name: "/details",
          page: () => Details(),
          transition: Transition.cupertino),
      GetPage(
          name: "/cart",
          page: () => CartView(),
          transition: Transition.cupertino),
    ],
  ));
}
