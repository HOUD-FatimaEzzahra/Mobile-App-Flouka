import 'package:flutter_auth/models/categorie.dart';
import 'package:flutter_auth/models/photo.dart';
import 'dart:convert';

import 'package:flutter_auth/models/preparationElement.dart';

class Produit {
  Produit({
    this.id,
    this.nom,
    this.codeComptable,
    this.codeAnalytique,
    this.photoPrincipale,
    this.descriptionF,
    this.descriptionC,
    this.active,
    this.profilType,
    this.sousCategorieId,
    this.familleId,
    this.modeVenteId,
    this.uniteId,
    this.uniteAfficheId,
    this.modePreparationId,
    this.createdAt,
    this.updatedAt,
    this.uniteVente,
    this.uniteAffiche,
    this.photos,
    this.preparations,
  });

  int id;
  String nom;
  dynamic codeComptable;
  dynamic codeAnalytique;
  String photoPrincipale;
  String descriptionF;
  String descriptionC;
  bool active;
  int profilType;
  int sousCategorieId;
  int familleId;
  int modeVenteId;
  int uniteId;
  int uniteAfficheId;
  int modePreparationId;
  DateTime createdAt;
  DateTime updatedAt;
  Categorie uniteVente;
  Categorie uniteAffiche;
  List<Photo> photos;
  List<PreparationElement> preparations;

  factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        id: json["id"],
        nom: json["nom"],
        codeComptable: json["code_comptable"],
        codeAnalytique: json["code_analytique"],
        photoPrincipale: json["photo_principale"],
        descriptionF: json["description_f"],
        descriptionC: json["description_c"],
        active: json["active"],
        profilType: json["profil_type"],
        sousCategorieId: json["sous_categorie_id"],
        familleId: json["famille_id"],
        modeVenteId: json["mode_vente_id"],
        uniteId: json["unite_id"],
        uniteAfficheId: json["unite_affiche_id"],
        modePreparationId: json["mode_preparation_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        uniteVente: Categorie.fromJson(json["unite_vente"]),
        uniteAffiche: Categorie.fromJson(json["unite_affiche"]),
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        preparations: List<PreparationElement>.from(
            json["preparations"].map((x) => PreparationElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "code_comptable": codeComptable,
        "code_analytique": codeAnalytique,
        "photo_principale": photoPrincipale,
        "description_f": descriptionF,
        "description_c": descriptionC,
        "active": active,
        "profil_type": profilType,
        "sous_categorie_id": sousCategorieId,
        "famille_id": familleId,
        "mode_vente_id": modeVenteId,
        "unite_id": uniteId,
        "unite_affiche_id": uniteAfficheId,
        "mode_preparation_id": modePreparationId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "unite_vente": uniteVente.toJson(),
        "unite_affiche": uniteAffiche.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "preparations": List<dynamic>.from(preparations.map((x) => x.toJson())),
      };
}
