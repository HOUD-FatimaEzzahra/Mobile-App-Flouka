import 'dart:convert';

class Ville {
  static List<Ville> villeFromJson(String str) =>
      List<Ville>.from(json.decode(str).map((x) => Ville.fromJson(x)));

  static String villeToJson(List<Ville> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Ville({
    this.id,
    this.nom,
    this.livraison,
    this.regionId,
  });

  int id;
  String nom;
  bool livraison;
  int regionId;

  factory Ville.fromJson(Map<String, dynamic> json) => Ville(
        id: json["id"],
        nom: json["nom"],
        livraison: json["livraison"],
        regionId: json["region_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "livraison": livraison,
        "region_id": regionId,
      };
}
