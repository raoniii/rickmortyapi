import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmortydex/bloc/rickmorty_event.dart';
import 'package:rickmortydex/bloc/rickmorty_state.dart';
import 'package:rickmortydex/model/character_repository.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()){
    on<CharacterPageRequest>(_oncharacterRepository);
  }

  final _characterRepository = CharacterRepository();

  void _oncharacterRepository(
      CharacterPageRequest event, Emitter<CharacterState> emit) async {
    emit(CharacterLoadProgress());
    try {
      final characterPageResponse =
      await _characterRepository.getCharacterPage(event.page);
      emit(CharacterPageLoadSuccess(
          characterListings: characterPageResponse.characterListings,
          canLoadNextPage: characterPageResponse.canLoadNextPage));
    } catch (e) {
      emit(CharacterPageLoadFailed(error: e.toString()));
    }
  }

}
