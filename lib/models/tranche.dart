class Tranche {
  Tranche({
    this.id,
    this.nom,
    this.uid,
  });

  int id;
  String nom;
  String uid;

  factory Tranche.fromJson(Map<String, dynamic> json) => Tranche(
        id: json["id"],
        nom: json["nom"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "uid": uid,
      };
}
