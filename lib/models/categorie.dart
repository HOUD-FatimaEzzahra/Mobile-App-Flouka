class Categorie {
  Categorie({
    this.id,
    this.nom,
    this.active,
  });

  int id;
  String nom;
  bool active;

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
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
