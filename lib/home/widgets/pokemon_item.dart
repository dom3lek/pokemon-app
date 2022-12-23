import 'package:api_client/api_client.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/home/home.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                pokemon.name.toUpperCase(),
                style: Theme.of(context).textTheme.headline3,
              ),
              CachedNetworkImage(
                imageUrl: pokemon.sprites.frontDefault,
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<FavouritePokemonsBloc>()
                  .add(AddPokemon(pokemon: pokemon));
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
