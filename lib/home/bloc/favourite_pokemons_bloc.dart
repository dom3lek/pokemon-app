import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_pokemons_event.dart';
part 'favourite_pokemons_state.dart';

class FavouritePokemonsBloc
    extends Bloc<FavouritePokemonsEvent, FavouritePokemonsState> {
  FavouritePokemonsBloc()
      : super(
          const FavouritePokemonsState(
            favouritePokemons: [],
          ),
        ) {
    on<AddPokemon>(_onAddPokemon);
    on<ReOrderPokemon>(_onReorderPokemon);
  }

  Future<void> _onAddPokemon(
    AddPokemon event,
    Emitter<FavouritePokemonsState> emit,
  ) async {
    final favouritePokemons = state.favouritePokemons..add(event.pokemon);

    emit(
      FavouritePokemonsState(
        favouritePokemons: favouritePokemons,
      ),
    );
  }

  Future<void> _onReorderPokemon(
    ReOrderPokemon event,
    Emitter<FavouritePokemonsState> emit,
  ) async {
    final favouritesPokemons = List<Pokemon>.from(state.favouritePokemons);
    var newIndex = event.newIndex;
    final oldIndex = event.oldIndex;

    if (event.oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = favouritesPokemons.removeAt(oldIndex);
    favouritesPokemons.insert(newIndex, item);

    emit(FavouritePokemonsState(favouritePokemons: favouritesPokemons));
  }
}
