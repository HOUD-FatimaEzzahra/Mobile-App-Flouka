import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/views/widgets/rounded_button.dart';
import 'package:get/get.dart';

class Confirmation extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.1),
              Container(
                  width: 200,
                  child: Image(
                    image: AssetImage(confirmationIcon),
                  )),
              SizedBox(height: size.height * 0.30),
              Text(
                topText,
                style: topTextStyle,
              ),
              Text(
                bottomText,
                style: bottomTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                  width: 150,
                  color: buttonColor,
                  text: buttonText,
                  press: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
