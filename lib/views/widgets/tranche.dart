import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/controllers/detailsController.dart';
import 'package:flutter_auth/models/stock.dart';
import 'package:get/get.dart';

class Tranche extends StatelessWidget {
  DetailsController detailsController = Get.find();
  Stock produit;
  int index;
  Tranche({this.index, this.produit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: lightBlueColor, width: 2)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: lightBlueColor,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(produit.tranche.nom,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        child: Container(
                          height: 40,
                          color: Colors.blue,
                          child: IconButton(
                              onPressed: () {
                                detailsController.decrementQte(this.index);
                              },
                              icon: Icon(
                                Icons.remove_rounded,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Container(
                          height: 40,
                          color: Color(0xffE8E8E8),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Obx(
                              () => Text(
                                (detailsController.qte.value[index][0] == 0)
                                    ? "Qte"
                                    : detailsController.qte.value[index][0]
                                        .toString(),
                              ),
                            ),
                          )),
                      Container(
                          height: 40,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              produit.stock.produit.uniteAffiche.nom,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: darkGray),
                            ),
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: Container(
                          height: 40,
                          color: Colors.blue,
                          child: IconButton(
                              onPressed: () {
                                detailsController.incrementQte(this.index);
                              },
                              icon: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(produit.prixN.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: lightBlueColor)),
                Text(" DH/" + produit.stock.produit.uniteVente.nom,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, color: darkGray))
              ],
            ),
          )
        ],
      ),
    );
  }
}
