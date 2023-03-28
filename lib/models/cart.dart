import 'dart:convert';

import 'package:flutter_auth/models/stock.dart';

class Cart {
  static List<Cart> cartFromJson(String str) =>
      List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

  static String cartToJson(List<Cart> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  List<Stock> produits;
  int qte;
  double totalPrice;
  String id;
  List<Stock> get getProduit => this.produits;
  int get getQte => this.qte;
  double get getTotalPrice => this.totalPrice;
  Cart({this.id, this.produits, this.qte, this.totalPrice});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        produits: Stock.stockFromJson(json["produits"]),
        id: json["id"],
        qte: json["qte"],
        totalPrice: json["totalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "produits": Stock.stockToJson(produits),
        "qte": qte,
        "id": id,
        "totalPrice": totalPrice,
      };
}
