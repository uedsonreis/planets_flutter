class Planet {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final String mass;
  final String volume;

  Planet(
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.mass,
    this.volume,
  );

  Planet.fromJson(dynamic json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imgSrc'][0]['img'],
        description = json['description'],
        mass = json['basicDetails'][0]['mass'],
        volume = json['basicDetails'][0]['volume'];
}
