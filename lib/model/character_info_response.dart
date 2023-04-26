class CharacterInfoResponse {
  final int id;
  final String name;
  final String species;
  final String image;

  CharacterInfoResponse(
      {required this.id,
      required this.name,
      required this.species,
      required this.image});

  factory CharacterInfoResponse.fromJson(Map<String, dynamic> json) {
    return CharacterInfoResponse(
        id: json['id'],
        name: json['name'],
        species: json['species'],
        image: json['image']);
  }
}
