part of 'favourite_pokemons_bloc.dart';

class FavouritePokemonsState extends Equatable {
  const FavouritePokemonsState({
    required this.favouritePokemons,
  });
  final List<Pokemon> favouritePokemons;

  @override
  List<Object> get props => [favouritePokemons];
}
