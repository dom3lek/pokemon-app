import 'package:api_client/api_client.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/home/bloc/favourite_pokemons_bloc.dart';

void main() {
  group('FavouritePokemonsBloc', () {
    final pokemon = Pokemon(
      name: 'name',
      abilities: [],
      sprites: Sprite(
        frontDefault: '',
      ),
    );

    test('has correct initial state', () {
      expect(
        FavouritePokemonsBloc().state,
        equals(
          const FavouritePokemonsState(favouritePokemons: []),
        ),
      );
    });

    blocTest<FavouritePokemonsBloc, FavouritePokemonsState>(
      'emits FavouritePokemonsState when AddPokemon is added.',
      build: FavouritePokemonsBloc.new,
      act: (bloc) => bloc.add(AddPokemon(pokemon: pokemon)),
      expect: () => <FavouritePokemonsState>[
        FavouritePokemonsState(favouritePokemons: [pokemon])
      ],
    );
  });
}
