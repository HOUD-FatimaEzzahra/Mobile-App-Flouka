import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/controllers/cartController.dart';
import 'package:flutter_auth/helper/heper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 90,
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
                                  "Panier",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 120,
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600),
                    ),
                    Obx(
                      () => Text(
                        cartController.total.value.toString() + " Dh",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: darkBlueColor,
                    onPressed: () {},
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          "PAYER",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: cartController.cartList.length == 0
              ? Center(
                  child: Text("pas de produit",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: lightGray)),
                )
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartController.cartList.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return FadeInDown(
                            duration: Duration(milliseconds: 350 * index),
                            child: Slidable(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 30),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 2,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                blurRadius: 4)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            bottom: 0),
                                        child: Column(
                                          children: <Widget>[
                                            Center(
                                              child: Container(
                                                width: 120,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          Helper.imageFormatter(
                                                              cartController
                                                                  .cartList[
                                                                      index]
                                                                  .produits[0]
                                                                  .photoPrincipale),
                                                        ),
                                                        fit: BoxFit.fill)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          cartController.cartList[index]
                                                  .produits[0].nom[0]
                                                  .toUpperCase() +
                                              cartController.cartList[index]
                                                  .produits[0].nom
                                                  .substring(1)
                                                  .toLowerCase(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          cartController.cartList[index]
                                              .produits[0].stock.categorie.nom,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              (double.parse(cartController
                                                          .cartList[index]
                                                          .produits[0]
                                                          .poids) !=
                                                      0)
                                                  ? ""
                                                  : cartController
                                                      .cartList[index]
                                                      .produits[0]
                                                      .tranche
                                                      .nom
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              (double.parse(cartController
                                                          .cartList[index]
                                                          .produits[0]
                                                          .poids) !=
                                                      0)
                                                  ? (double.parse(cartController
                                                              .cartList[index]
                                                              .produits[0]
                                                              .poids) <
                                                          1)
                                                      ? ((double.parse(cartController
                                                                      .cartList[
                                                                          index]
                                                                      .produits[
                                                                          0]
                                                                      .poids) *
                                                                  1000)
                                                              .toString() +
                                                          " " +
                                                          "grammes"
                                                              " |")
                                                      : (cartController
                                                              .cartList[index]
                                                              .produits[0]
                                                              .poids +
                                                          " " +
                                                          cartController
                                                              .cartList[index]
                                                              .produits[0]
                                                              .stock
                                                              .produit
                                                              .uniteVente
                                                              .nom +
                                                          " |")
                                                  : ("x" +
                                                      cartController
                                                          .cartList[index].qte
                                                          .toString() +
                                                      " |"),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              cartController
                                                  .cartList[index].totalPrice
                                                  .toStringAsFixed(2)
                                                  .toString(),
                                              style: TextStyle(
                                                  color: darkBlueColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              " Dh",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                          ],
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              secondaryActions: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: GestureDetector(
                                    onTap: () => cartController
                                        .deleteProductByIndex(index),
                                    child: Container(
                                      width: 50,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
