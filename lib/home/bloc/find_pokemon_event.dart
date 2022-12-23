part of 'find_pokemon_bloc.dart';

abstract class FindPokemonEvent {}

class FindPokemon extends FindPokemonEvent {
  FindPokemon({
    required this.name,
  });

  String name;
}
