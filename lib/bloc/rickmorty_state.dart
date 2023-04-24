import 'package:rickmortydex/model/page_response_character.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoadProgress extends CharacterState {}

class CharacterPageLoadSuccess extends CharacterState {
  final List<CharacterListing> characterListings;
  final bool canLoadNextPage;
  final int currentPage;

  CharacterPageLoadSuccess({
    required this.characterListings,
    required this.canLoadNextPage,
    required this.currentPage,
  });
}

class CharacterPageLoadFailed extends CharacterState {
  final String error;

  CharacterPageLoadFailed({required this.error});
}
