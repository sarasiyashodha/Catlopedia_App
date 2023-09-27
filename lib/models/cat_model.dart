class CatModel {
  String? id;
  String? name;
  String? origin;
  String? lifeSpan;
  String? temperament;
  String? description;

  CatModel(
      {this.id,
      this.name,
      this.origin,
      this.lifeSpan,
      this.temperament,
      this.description});

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      lifeSpan: json['life_span'],
      temperament: json['temperament'],
      description: json['description']

    );
  }
}
