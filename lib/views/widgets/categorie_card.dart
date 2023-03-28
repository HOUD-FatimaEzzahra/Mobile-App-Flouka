import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/controllers/stockController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  StockController stockController = Get.find();
  String name;
  Image image;
  int cat;
  String svg;

  CategoryCard({this.image, this.name, this.cat, this.svg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        stockController.changeStockStates(cat);
        Get.toNamed("/products", arguments: [cat, name, svg]);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 10)
                ],
                borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      child: image,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.4),
                            Colors.black.withOpacity(.2),
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            svg,
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.15,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(
              color: lightGray,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
