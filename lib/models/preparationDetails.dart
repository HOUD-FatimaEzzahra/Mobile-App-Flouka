class PreparationPreparation {
  PreparationPreparation({
    this.id,
    this.nom,
  });

  int id;
  String nom;

  factory PreparationPreparation.fromJson(Map<String, dynamic> json) =>
      PreparationPreparation(
        id: json["id"],
        nom: json["nom"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
      };
}
