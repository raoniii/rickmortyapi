class CharacterListing {
  final String id;
  final String name;
  final String url;

  String get imageUrl =>
      'https://rickandmortyapi.com/api/character/avatar/$id.jpeg';

  CharacterListing({required this.id, required this.name, required this.url});

  factory CharacterListing.fromJson(Map<String, dynamic> json) {
    final name = json["name"];
    final url = json['url'] as String;
    final String id = url.split('/')[5];

    return CharacterListing(id: id, name: name, url: url);
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
