class CatModel {
  String? id;
  String? name;
  String? origin;
  String? lifespan;
  String? temperament;
  String? description;
  String? referenceImageID;

  CatModel(
      {this.id,
      this.name,
      this.origin,
      this.lifespan,
      this.temperament,
      this.description,
      this.referenceImageID,
      });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      lifespan: json['life_span'],
      temperament: json['temperament'],
      description: json['description'],
      referenceImageID: json['reference_image_id']

    );
  }
}
