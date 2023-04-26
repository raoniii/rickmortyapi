import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmortydex/model/character_details.dart';
import 'package:rickmortydex/model/character_info_response.dart';
import 'package:rickmortydex/model/character_repository.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetails?> {
  final _characterRepository = CharacterRepository();

  CharacterDetailsCubit() : super(null);

  void getCharacterDetails(int characterId) async {
    // define um valor padrão caso characterId seja nulo

    final responses = await Future.wait(
        [_characterRepository.getCharacterInfor(characterId)]);

    final characterInfo = responses[0] as CharacterInfoResponse;

    if (characterInfo != null) {
      emit(CharacterDetails(
          id: characterInfo.id,
          name: characterInfo.name,
        species: characterInfo.species,
        image:  characterInfo.image,
          ));
    }

    // emit(
    //   CharacterDetails(
    //       id: (characterInfo.id),
    //       name: characterInfo.name,
    //       imageUrl: characterInfo.imageUrl),
    // );
  }

  void clearCharacterDetails() =>
      emit(CharacterDetails(id: 0, name: "", species: "",image: ""));
}
