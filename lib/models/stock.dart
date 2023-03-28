import 'dart:convert';

import 'package:flutter_auth/models/stockClass.dart';
import 'package:flutter_auth/models/tranche.dart';

class Stock {
  static List<Stock> stockFromJson(String str) =>
      List<Stock>.from(json.decode(str).map((x) => Stock.fromJson(x)));

  static String stockToJson(List<Stock> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  Stock({
    this.id,
    this.stocksId,
    this.code,
    this.poids,
    this.qteRestante,
    this.cr,
    this.prixN,
    this.prixF,
    this.prixP,
    this.pas,
    this.promoId,
    this.trancheId,
    this.qualiteId,
    this.active,
    this.type,
    this.qte,
    this.prixAchat,
    this.uniteId,
    this.brNum,
    this.lotNum,
    this.categorieId,
    this.produitId,
    this.depotId,
    this.nom,
    this.orderPriorite,
    this.villeId,
    this.villeZoneId,
    this.codeComptable,
    this.codeAnalytique,
    this.photoPrincipale,
    this.descriptionF,
    this.descriptionC,
    this.profilType,
    this.sousCategorieId,
    this.familleId,
    this.modeVenteId,
    this.uniteAfficheId,
    this.modePreparationId,
    this.stockLignesId,
    this.stock,
    this.tranche,
  });

  int id;
  int stocksId;
  int code;
  String poids;
  String qteRestante;
  String cr;
  String prixN;
  String prixF;
  String prixP;
  String pas;
  dynamic promoId;
  String trancheId;
  int qualiteId;
  bool active;
  String type;
  String qte;
  String prixAchat;
  int uniteId;
  String brNum;
  String lotNum;
  int categorieId;
  int produitId;
  int depotId;
  String nom;
  int orderPriorite;
  int villeId;
  int villeZoneId;
  dynamic codeComptable;
  dynamic codeAnalytique;
  String photoPrincipale;
  String descriptionF;
  String descriptionC;
  int profilType;
  int sousCategorieId;
  int familleId;
  int modeVenteId;
  int uniteAfficheId;
  int modePreparationId;
  int stockLignesId;
  StockClass stock;
  Tranche tranche;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        id: json["id"],
        stocksId: json["stocks_id"],
        code: json["code"],
        poids: json["poids"],
        qteRestante: json["qte_restante"],
        cr: json["cr"],
        prixN: json["prix_n"],
        prixF: json["prix_f"],
        prixP: json["prix_p"],
        pas: json["pas"],
        promoId: json["promo_id"],
        trancheId: json["tranche_id"],
        qualiteId: json["qualite_id"],
        active: json["active"],
        type: json["type"],
        qte: json["qte"],
        prixAchat: json["prix_achat"],
        uniteId: json["unite_id"],
        brNum: json["br_num"],
        lotNum: json["lot_num"],
        categorieId: json["categorie_id"],
        produitId: json["produit_id"],
        depotId: json["depot_id"],
        nom: json["nom"],
        orderPriorite: json["order_priorite"],
        villeId: json["ville_id"],
        villeZoneId: json["ville_zone_id"],
        codeComptable: json["code_comptable"],
        codeAnalytique: json["code_analytique"],
        photoPrincipale: json["photo_principale"],
        descriptionF: json["description_f"],
        descriptionC: json["description_c"],
        profilType: json["profil_type"],
        sousCategorieId: json["sous_categorie_id"],
        familleId: json["famille_id"],
        modeVenteId: json["mode_vente_id"],
        uniteAfficheId: json["unite_affiche_id"],
        modePreparationId: json["mode_preparation_id"],
        stockLignesId: json["stock_lignes_id"],
        stock: StockClass.fromJson(json["stock"]),
        tranche: Tranche.fromJson(json["tranche"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stocks_id": stocksId,
        "code": code,
        "poids": poids,
        "qte_restante": qteRestante,
        "cr": cr,
        "prix_n": prixN,
        "prix_f": prixF,
        "prix_p": prixP,
        "pas": pas,
        "promo_id": promoId,
        "tranche_id": trancheId,
        "qualite_id": qualiteId,
        "active": active,
        "type": type,
        "qte": qte,
        "prix_achat": prixAchat,
        "unite_id": uniteId,
        "br_num": brNum,
        "lot_num": lotNum,
        "categorie_id": categorieId,
        "produit_id": produitId,
        "depot_id": depotId,
        "nom": nom,
        "order_priorite": orderPriorite,
        "ville_id": villeId,
        "ville_zone_id": villeZoneId,
        "code_comptable": codeComptable,
        "code_analytique": codeAnalytique,
        "photo_principale": photoPrincipale,
        "description_f": descriptionF,
        "description_c": descriptionC,
        "profil_type": profilType,
        "sous_categorie_id": sousCategorieId,
        "famille_id": familleId,
        "mode_vente_id": modeVenteId,
        "unite_affiche_id": uniteAfficheId,
        "mode_preparation_id": modePreparationId,
        "stock_lignes_id": stockLignesId,
        "stock": stock.toJson(),
        "tranche": tranche.toJson(),
      };
}
