import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickmortydex/model/page_response_character.dart';

class CharacterRepository {
  final baseurl = 'rickandmortyapi.com';
  final client = http.Client();

  Future<CharacterPageResponse> getCharacterPage(int pageIndex) async {
    // ?page=1
    final queryParameters = {

      'page': (pageIndex * 20).toString()
    };

    final uri = Uri.https(baseurl, "/api/character", queryParameters );
    final response = await client.get(uri as Uri);
    final json = jsonDecode(response.body);

    return CharacterPageResponse.fromJson(json);
  }
}
