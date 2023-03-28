import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/views/widgets/villePopup.dart';
import 'package:flutter_auth/controllers/villeController.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  VilleController villeController = Get.find();
  @override
  final Size preferredSize;
  CustomAppBar({Key key})
      : preferredSize = Size.fromHeight(90),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    String _currentRoute = ModalRoute.of(context).settings.name;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              decoration: BoxDecoration(color: darkBlueColor, boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 10)
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 15),
                  Container(
                    height: 30,
                    child: RawMaterialButton(
                        fillColor: lightBlueColor,
                        splashColor: darkBlueColor,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, left: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Obx(() => Text(
                                    (villeController.isVilleSelected.value)
                                        ? villeController
                                            .selectedVille.value.nom
                                        : "Zone Livraison",
                                    maxLines: 1,
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        onPressed: () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => VillePopup()),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                  Spacer(),
                  Row(children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "+212 6 19 82 65 01",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ]),
                  SizedBox(width: 15),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: IconButton(
                    onPressed: () {
                      homeScreenScaffold.currentState.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    splashColor: darkBlueColor,
                  )),
                  Spacer(),
                  Container(
                    child: Row(
                      children: [
                        // IconButton(
                        //   icon: Icon(Icons.search, color: darkBlueColor),
                        //   onPressed: () => {},
                        // ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart, color: Colors.white),
                          splashColor: darkBlueColor,
                          onPressed: () => {Get.toNamed("/cart")},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // AppBar(
    //   elevation: 0,
    //   backgroundColor: Colors.white,
    //   leading: IconButton(
    //       onPressed: () {
    //         homeScreenScaffold.currentState.openDrawer();
    //       },
    //       icon: Icon(
    //         Icons.menu,
    //         color: Theme.of(context).primaryColor,
    //       )),
    //   primary: false,
    //   title: TextField(
    //       onChanged: (value) {
    //         restaurantController.filterRestaurants(value);
    //       },
    //       decoration: InputDecoration(
    //           hintText: " Search",
    //           border: InputBorder.none,
    //           hintStyle: TextStyle(color: Colors.grey))),
    //   actions: <Widget>[
    //     IconButton(
    //         icon: Icon(Icons.shopping_cart, color: darkBlueColor),
    //         onPressed: () => {}
    //         // showDialog(
    //         //     barrierDismissible: false,
    //         //     context: context,
    //         //     builder: (context) => VillePopup()),
    //         ),
    //   ],
    // );
  }
}
