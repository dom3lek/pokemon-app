import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'find_pokemon_event.dart';
part 'find_pokemon_state.dart';

class FindPokemonBloc extends Bloc<FindPokemonEvent, FindPokemonState> {
  FindPokemonBloc({required ApiClient apiClient})
      : _apiClient = apiClient,
        super(FindPokemonInitial()) {
    on<FindPokemon>(
      _onFindPokemon,
      transformer: _debounce(
        const Duration(milliseconds: 500),
      ),
    );
  }

  final ApiClient _apiClient;

  EventTransformer<Event> _debounce<Event>(Duration duration) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }

  Future<void> _onFindPokemon(
    FindPokemon event,
    Emitter<FindPokemonState> emit,
  ) async {
    try {
      final result = await _apiClient.fetchData(pokemonName: event.name);

      emit(FindPokemonPopulated(pokemon: result));
    } catch (e) {
      if (e is EmptyResultException || e is JsonSerializableException) {
        emit(FindPokemonEmpty());
      }
      addError(e);
    }
  }
}
