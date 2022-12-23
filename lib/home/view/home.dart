import 'package:api_client/api_client.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FindPokemonBloc>(
          create: (_) => FindPokemonBloc(apiClient: context.read<ApiClient>()),
        ),
        BlocProvider<FavouritePokemonsBloc>(
          create: (context) => FavouritePokemonsBloc(),
        ),
      ],
      child: const HomeView(),
    );
  }
}

@visibleForTesting
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              context.read<FindPokemonBloc>().add(FindPokemon(name: value));
            },
            decoration: const InputDecoration(
              hintText: "Type pokemon name you're looking for",
            ),
          ),
          const SizedBox(height: 12),
          BlocBuilder<FindPokemonBloc, FindPokemonState>(
            builder: (context, state) {
              if (state is FindPokemonPopulated) {
                return PokemonItem(pokemon: state.pokemon);
              } else if (state is FindPokemonEmpty) {
                return const Text('Not found');
              }
              return const SizedBox.shrink();
            },
          ),
          BlocBuilder<FavouritePokemonsBloc, FavouritePokemonsState>(
            builder: (context, state) {
              return ReorderableListView(
                shrinkWrap: true,
                children: [
                  ...state.favouritePokemons.map(
                    (pokemon) => Row(
                      key: Key(pokemon.name),
                      children: [
                        CachedNetworkImage(
                          imageUrl: pokemon.sprites.frontDefault,
                        ),
                        Text(
                          pokemon.name,
                        ),
                      ],
                    ),
                  )
                ],
                onReorder: (oldIndex, newIndex) {
                  context.read<FavouritePokemonsBloc>().add(
                        ReOrderPokemon(oldIndex: oldIndex, newIndex: newIndex),
                      );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
