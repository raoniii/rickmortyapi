import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickmortydex/model/page_response_character.dart';

class CharacterRepository {
  final baseurl = 'rickandmortyapi.com';
  final client = http.Client();

  Future<CharacterPage> getCharacterPage(int pageIndex) async {
    final queryParameters = {"page": pageIndex.toString()};
    final uri = Uri.https(baseurl, "/api/character/", queryParameters);
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return CharacterPage.fromJson(json);
  }
}
