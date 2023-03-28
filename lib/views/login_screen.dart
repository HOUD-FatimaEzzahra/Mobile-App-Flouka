import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/controllers/authController.dart';
import 'package:flutter_auth/views/widgets/rounded_button.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: authLinarGrad)),
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.1),
                    Image.asset(
                      logoFloukaPrimary,
                      height: size.height * 0.12,
                    ),
                    SizedBox(height: size.height * 0.1),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "E-mail",
                                prefixIcon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.emailController,
                              onSaved: (value) {
                                controller.email = value;
                              },
                              validator: (value) {
                                return controller.validateEmail(value);
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "Mot de passe",
                                prefixIcon: Icon(Icons.lock),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              controller: controller.passwordController,
                              onSaved: (value) {
                                controller.password = value;
                              },
                              validator: (value) {
                                return controller.validatePassword(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    RoundedButton(
                        width: 150,
                        color: loginButtonColor,
                        text: loginButton,
                        press: () => controller.checkLogin()),
                    SizedBox(height: size.height * 0.30),
                    Text(
                      loginBottomText,
                      style: loginBottomTextStyle,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed("/signup"),
                      child: Text(loginBottomButton,
                          style: loginBottomButtomStyle),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
