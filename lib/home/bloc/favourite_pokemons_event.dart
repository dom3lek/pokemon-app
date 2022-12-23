part of 'favourite_pokemons_bloc.dart';

abstract class FavouritePokemonsEvent {}

class AddPokemon extends FavouritePokemonsEvent {
  AddPokemon({
    required this.pokemon,
  });

  final Pokemon pokemon;
}

class ReOrderPokemon extends FavouritePokemonsEvent {
  ReOrderPokemon({
    required this.oldIndex,
    required this.newIndex,
  });

  final int oldIndex;
  final int newIndex;
}
