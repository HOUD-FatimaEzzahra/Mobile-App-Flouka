import 'package:flutter/material.dart';
import 'package:flutter_auth/models/stock.dart';
import 'package:flutter_auth/helper/heper.dart';

class ProductCard extends StatelessWidget {
  Stock produit;
  Function onCardClick;

  ProductCard({this.produit, this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick();
      },
      child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15)
            ],
          ),
          margin: EdgeInsets.all(20),
          height: 150,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                        image: NetworkImage(Helper.imageFormatter(
                            this.produit.photoPrincipale)),
                        fit: BoxFit.cover)
                    // (imgDomaine + this.produit.photoPrincipale.substring(6)),

                    ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent
                            ]))),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text(this.produit.nom,
                          style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
