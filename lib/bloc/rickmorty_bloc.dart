import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmortydex/bloc/rickmorty_event.dart';
import 'package:rickmortydex/bloc/rickmorty_state.dart';
import 'package:rickmortydex/model/character_repository.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()){
    on<CharacterPageRequest>(_oncharacterRepository);
  }

  final _characterRepository = CharacterRepository();

  void loadNextPage() async {
    final currentState = state;
    if (currentState is CharacterPageLoadSuccess) {
      final nextPageIndex = currentState.currentPage + 1;
      try {
        final nextPage = await _characterRepository.getCharacterPage(nextPageIndex);
        final newListings = [...currentState.characterListings, ...nextPage.characterListings];
        final canLoadNextPage = nextPage.canLoadNextPage;
        emit(CharacterPageLoadSuccess(
          characterListings: newListings,
          canLoadNextPage: canLoadNextPage,
          currentPage: nextPageIndex,
        ));
      } catch (e) {
        emit(CharacterPageLoadFailed(error: e.toString()));
      }
    }
  }

  void _oncharacterRepository(
      CharacterPageRequest event, Emitter<CharacterState> emit) async {
    emit(CharacterLoadProgress());
    try {
      final characterPageResponse =
      await _characterRepository.getCharacterPage(event.page);
      emit(CharacterPageLoadSuccess(
          characterListings: characterPageResponse.characterListings,
          canLoadNextPage: characterPageResponse.canLoadNextPage, currentPage: 1));
    } catch (e) {
      emit(CharacterPageLoadFailed(error: e.toString()));
    }
  }


}
