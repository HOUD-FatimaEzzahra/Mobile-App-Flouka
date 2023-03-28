import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/controllers/cartController.dart';
import 'package:flutter_auth/controllers/detailsController.dart';
import 'package:flutter_auth/controllers/stockController.dart';
import 'package:flutter_auth/views/widgets/product_card.dart';
import 'package:flutter_auth/views/widgets/sous_categories.dart';
import 'package:flutter_auth/views/widgets/villePopup.dart';
import 'package:flutter_auth/controllers/villeController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductView extends StatelessWidget {
  final session = GetStorage();
  StockController stockController = Get.find();
  VilleController villeController = Get.find();
  CartController cartController = Get.find();
  DetailsController detailsController = Get.find();
  List args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                color: productAppBartopAreaColor,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(width: 15),
                    Container(
                      height: 30,
                      child: RawMaterialButton(
                          fillColor: productAppBartopAreaVilleButtonfillColor,
                          splashColor:
                              productAppBartopAreasplashVilleButtonColor,
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
                color: Colors.white,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: darkBlueColor,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  args[1],
                                  style: TextStyle(
                                    color: darkGray,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Spacer(),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.search, color: darkBlueColor),
                            onPressed: () => {},
                          ),
                          IconButton(
                            icon:
                                Icon(Icons.shopping_cart, color: darkBlueColor),
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
      ),
      body: Obx(
        () => Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: stockController.products.length <= 0
              ? Center(
                  child: Text("Pas de Produits"),
                  // child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: stockController.products.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return ZoomIn(
                              duration: Duration(milliseconds: 100 * index),
                              child: ProductCard(
                                  produit:
                                      stockController.products.value[index],
                                  onCardClick: () {
                                    detailsController.changeDetailsState(
                                      stockController.products.value[index],
                                    );
                                    Get.toNamed("/details");
                                  }));
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: Container(
        child: SousCategories(),
      ),
    );
  }
}
