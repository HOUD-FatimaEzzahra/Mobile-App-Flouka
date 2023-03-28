class Depot {
  Depot({
    this.id,
    this.nom,
    this.orderPriorite,
    this.villeId,
    this.villeZoneId,
  });

  int id;
  String nom;
  int orderPriorite;
  int villeId;
  int villeZoneId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Depot.fromJson(Map<String, dynamic> json) => Depot(
        id: json["id"],
        nom: json["nom"],
        orderPriorite: json["order_priorite"],
        villeId: json["ville_id"],
        villeZoneId: json["ville_zone_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "order_priorite": orderPriorite,
        "ville_id": villeId,
        "ville_zone_id": villeZoneId,
      };
}
