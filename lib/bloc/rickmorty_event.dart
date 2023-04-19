abstract class CharacterEvent {}

class CharacterPageRequest extends CharacterEvent {
  final int page;

  CharacterPageRequest({required this.page});
}
