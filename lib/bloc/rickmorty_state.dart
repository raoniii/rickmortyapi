import 'package:rickmortydex/model/page_response_character.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoadProgress extends CharacterState {}

class CharacterPageLoadSuccess extends CharacterState {
  late final List<CharacterListing> characterListings;
  late final bool canLoadNextPage;

  CharacterPageLoadSuccess(
      {required this.characterListings, required this.canLoadNextPage});
}

class CharacterPageLoadFailed extends CharacterState {
  final String error;

  CharacterPageLoadFailed({required this.error});
}
