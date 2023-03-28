import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/controllers/cartController.dart';
import 'package:flutter_auth/views/widgets/cartegories.dart';
import 'package:flutter_auth/views/widgets/sidemenubar.dart';
import 'package:flutter_auth/views/widgets/customAppBar.dart';
import 'package:flutter_auth/views/widgets/villePopup.dart';
import 'package:flutter_auth/controllers/productViewController.dart';
import 'package:flutter_auth/controllers/villeController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_auth/constants.dart';

class HomeScreen extends StatelessWidget {
  final session = GetStorage();
  VilleController villeController = Get.find();
  ProductViewController pwc = Get.find();
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    if (session.read("villeSelected") == false) {
      Future.delayed(
          Duration.zero,
          () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => VillePopup()));
    }
    return Scaffold(
      key: homeScreenScaffold,
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: SideMenuBar(),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          color: homeBgColor,
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                  width: double.infinity,
                  child: Carousel(
                    images: customHeroList,
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    indicatorBgPadding: 5.0,
                    autoplayDuration: const Duration(seconds: 3),
                    dotBgColor: Colors.transparent,
                    moveIndicatorFromBottom: 180.0,
                    animationCurve: Curves.fastLinearToSlowEaseIn,
                    animationDuration: const Duration(seconds: 2),
                    boxFit: BoxFit.cover,
                  )),
              SizedBox(
                height: 20,
              ),
              Categories(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
