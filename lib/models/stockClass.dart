import 'package:flutter_auth/models/categorie.dart';
import 'package:flutter_auth/models/depot.dart';
import 'package:flutter_auth/models/produit.dart';

class StockClass {
  StockClass({
    this.id,
    this.type,
    this.qte,
    this.prixAchat,
    this.uniteId,
    this.lotNum,
    this.categorieId,
    this.produitId,
    this.depotId,
    this.depot,
    this.produit,
    this.categorie,
  });

  int id;
  String type;
  String qte;
  String prixAchat;
  int uniteId;
  String lotNum;
  int categorieId;
  int produitId;
  int depotId;
  Depot depot;
  Produit produit;
  Categorie categorie;

  factory StockClass.fromJson(Map<String, dynamic> json) => StockClass(
        id: json["id"],
        type: json["type"],
        qte: json["qte"],
        prixAchat: json["prix_achat"],
        uniteId: json["unite_id"],
        lotNum: json["lot_num"],
        categorieId: json["categorie_id"],
        produitId: json["produit_id"],
        depotId: json["depot_id"],
        depot: Depot.fromJson(json["depot"]),
        produit: Produit.fromJson(json["produit"]),
        categorie: Categorie.fromJson(json["categorie"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "qte": qte,
        "prix_achat": prixAchat,
        "unite_id": uniteId,
        "lot_num": lotNum,
        "categorie_id": categorieId,
        "produit_id": produitId,
        "depot_id": depotId,
        "depot": depot.toJson(),
        "produit": produit.toJson(),
        "categorie": categorie.toJson(),
      };
}
