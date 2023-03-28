import 'dart:convert';

class Zone {
  static List<Zone> zoneFromJson(String str) =>
      List<Zone>.from(json.decode(str).map((x) => Zone.fromJson(x)));

  static String zoneToJson(List<Zone> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Zone({
    this.id,
    this.nom,
    this.villeId,
  });

  int id;
  String nom;
  int villeId;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json["id"],
        nom: json["nom"],
        villeId: json["ville_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "ville_id": villeId,
      };
}
