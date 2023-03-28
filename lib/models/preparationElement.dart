import 'package:flutter_auth/models/preparationDetails.dart';

class PreparationElement {
  PreparationElement({
    this.id,
    this.produitId,
    this.preparationId,
    this.createdAt,
    this.updatedAt,
    this.preparation,
  });

  int id;
  int produitId;
  int preparationId;
  DateTime createdAt;
  DateTime updatedAt;
  PreparationPreparation preparation;

  factory PreparationElement.fromJson(Map<String, dynamic> json) =>
      PreparationElement(
        id: json["id"],
        produitId: json["produit_id"],
        preparationId: json["preparation_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        preparation: PreparationPreparation.fromJson(json["preparation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "produit_id": produitId,
        "preparation_id": preparationId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "preparation": preparation.toJson(),
      };
}
