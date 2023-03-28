import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/controllers/cartController.dart';
import 'package:flutter_auth/controllers/detailsController.dart';
import 'package:flutter_auth/controllers/productViewController.dart';
import 'package:flutter_auth/helper/heper.dart';
import 'package:flutter_auth/views/widgets/tranche.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  DetailsController detailsController = Get.find();
  CartController cartController = Get.find();
  ProductViewController pwc = Get.find();
  String chooseDescription() {
    switch (detailsController.listProducts.value[0][0].categorieId) {
      case 1:
        return detailsController
            .listProducts.value[0][0].stock.produit.descriptionC;
        break;
      case 2:
        return detailsController
            .listProducts.value[0][0].stock.produit.descriptionF;
        break;
      default:
        return ("description Epicerie ..... (pas encore faite)");
    }
  }

  String chooseSousCategorie() {
    return pwc.sousCategories
        .where((sousCat) => (sousCat.id ==
            detailsController.listProducts.value[0][0].sousCategorieId))
        .toList()[0]
        .nom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkBlueColor,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Helper.imageFormatter(
                          detailsController
                              .listProducts.value[0][0].photoPrincipale)),
                      fit: BoxFit.cover),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 10)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          detailsController.listProducts.value[0][0].nom,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(detailsController.listProducts
                                      .value[0][0].stock.categorie.nom),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(chooseSousCategorie()),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(detailsController
                                      .listProducts.value[0][0].nom),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(fontSize: 16, color: Colors.indigo),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          chooseDescription(),
                          style: TextStyle(height: 1.6),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: <Widget>[
                            (detailsController.listProducts.value.length <= 0)
                                ? Text("Voir votre panier")
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: detailsController
                                        .listProducts.value.length,
                                    itemBuilder: (BuildContext ctx, int i) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Tranche(
                                          index: i,
                                          produit: detailsController
                                              .listProducts[i][0],
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: Container(
              height: 60,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text("Total : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: darkBlueColor)),
                            Obx(() => Text(
                                detailsController.total.value.toString() +
                                    " DH",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: darkGray)))
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: darkBlueColor,
                        onPressed: () {
                          if (detailsController.total.value != 0.0) {
                            detailsController.addToCart();
                            detailsController.reset();
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              buttonsBorderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              headerAnimationLoop: false,
                              animType: AnimType.SCALE,
                              title: 'Success',
                              desc:
                                  'les produits ont été ajoutés à votre panier avec succès.',
                              showCloseIcon: false,
                              btnOkText: "Voir Panier",
                              btnOkIcon: Icons.shopping_cart_outlined,
                              btnOkColor: darkBlueColor,
                              btnCancelColor: lightBlueColor,
                              btnCancelText: "Continuer",
                              btnCancelIcon: Icons.arrow_back_outlined,
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            )..show();
                          }
                        },
                        child: Container(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Center(
                              child: Text(
                                "Ajouter au Panier",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
