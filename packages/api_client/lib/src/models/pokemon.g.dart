// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      name: json['name'] as String,
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: Sprite.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'abilities': instance.abilities,
      'sprites': instance.sprites,
    };

Sprite _$SpriteFromJson(Map<String, dynamic> json) => Sprite(
      frontDefault: json['front_default'] as String,
    );

Map<String, dynamic> _$SpriteToJson(Sprite instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      ability: json['ability'] == null
          ? null
          : AbilityData.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['isHidden'] as bool?,
      slot: json['slot'] as int?,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'ability': instance.ability,
      'isHidden': instance.isHidden,
      'slot': instance.slot,
    };

AbilityData _$AbilityDataFromJson(Map<String, dynamic> json) => AbilityData(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AbilityDataToJson(AbilityData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
