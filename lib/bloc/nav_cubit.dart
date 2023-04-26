import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmortydex/bloc/character_details_cubit.dart';

class NavCubit extends Cubit<int?> {
  CharacterDetailsCubit characterDetailsCubit;

  NavCubit({required this.characterDetailsCubit}) : super(null);

  void showCharacterDetails(int characterId) {

    print("characterId:");
    print(characterId);
    characterDetailsCubit.getCharacterDetails(characterId);
    emit(characterId);
  }

  void popToCharacter() {
    emit(null);
    characterDetailsCubit.clearCharacterDetails();
  }
}
