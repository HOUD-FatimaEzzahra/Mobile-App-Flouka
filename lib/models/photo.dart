class Photo {
  Photo({
    this.id,
    this.produitId,
    this.photo,
  });

  int id;
  int produitId;
  String photo;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        produitId: json["produit_id"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "produit_id": produitId,
        "photo": photo,
      };
}
