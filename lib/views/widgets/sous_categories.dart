import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/controllers/productViewController.dart';
import 'package:get/get.dart';

class SousCategories extends StatelessWidget {
  ProductViewController pwc = Get.find();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: Container(
        decoration: BoxDecoration(
            color: darkBlueColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        height: 55,
        child: ListView.builder(
            itemCount: pwc.sousCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return JelloIn(
                  duration: Duration(milliseconds: 200 * i),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        pwc.changeMenuIndex(i);
                        print(pwc.selectedIndexOfMenuList.value);
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: (i == pwc.selectedIndexOfMenuList.value)
                                ? lightBlueColor
                                : Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                pwc.sousCategories[i].nom,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        (i == pwc.selectedIndexOfMenuList.value)
                                            ? Colors.white
                                            : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
