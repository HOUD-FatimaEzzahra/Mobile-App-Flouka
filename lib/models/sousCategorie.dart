import 'dart:convert';

class SousCategorie {
  static List<SousCategorie> SousCategorieFromJson(String str) =>
      List<SousCategorie>.from(
          json.decode(str).map((x) => SousCategorie.fromJson(x)));

  static String SousCategorieToJson(List<SousCategorie> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  SousCategorie({
    this.id,
    this.nom,
    this.active,
  });

  int id;
  String nom;
  bool active;

  factory SousCategorie.fromJson(Map<String, dynamic> json) => SousCategorie(
        id: json["id"],
        nom: json["nom"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "active": active,
      };
}
