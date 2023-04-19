class CharacterListing {
  late final int id;
  late final String name;
  late final String status;
  late final String species;
  late final String type;
  late final String gender;
  String get imageUrl =>
  'https://rickandmortyapi.com/api/character/avatar/$id.jpeg';


  CharacterListing({required name, required id});

  factory CharacterListing.fromJson(Map<String, dynamic> json) {
    final id = json["id"];
    final name = json["name"];

    return CharacterListing(id: id, name: name);
  }

}

class CharacterPageResponse {
  final List<CharacterListing> characterListings;
  final bool canLoadNextPage;

  CharacterPageResponse(
      {required this.characterListings, required this.canLoadNextPage});

  factory CharacterPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final characterListings = (json['results'] as List)
        .map((listingJson) => CharacterListing.fromJson(listingJson))
        .toList();

    return CharacterPageResponse(
        characterListings: characterListings, canLoadNextPage: canLoadNextPage);
  }
}
