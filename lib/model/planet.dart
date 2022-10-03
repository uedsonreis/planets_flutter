class Planet {
  final int id;
  final String key;
  final String name;
  final String imageUrl;
  final String description;

  Planet(this.id, this.key, this.name, this.imageUrl, this.description);

  Planet.fromJson(dynamic json)
      : id = json['id'],
        key = json['key'],
        name = json['name'],
        imageUrl = json['imgSrc'][0]['img'],
        description = json['description'];
}
