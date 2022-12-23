part of 'find_pokemon_bloc.dart';

abstract class FindPokemonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindPokemonInitial extends FindPokemonState {}

class FindPokemonPopulated extends FindPokemonState {
  FindPokemonPopulated({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  List<Object> get props => [pokemon];
}

class FindPokemonEmpty extends FindPokemonState {}

class FindPokemonError extends FindPokemonState {}
