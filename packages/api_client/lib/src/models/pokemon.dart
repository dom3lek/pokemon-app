// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  Pokemon({
    required this.name,
    required this.abilities,
    required this.sprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  final String name;
  final List<Ability> abilities;
  final Sprite sprites;

  @override
  String toString() {
    return 'Pokemon: $name';
  }
}

@JsonSerializable()
class Sprite {
  Sprite({required this.frontDefault});

  factory Sprite.fromJson(Map<String, dynamic> json) => _$SpriteFromJson(json);

  @JsonKey(name: 'front_default')
  final String frontDefault;
  Map<String, dynamic> toJson() => _$SpriteToJson(this);
}

@JsonSerializable()
class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);

  AbilityData? ability;
  bool? isHidden;
  int? slot;
}

@JsonSerializable()
class AbilityData {
  AbilityData({
    required this.name,
    required this.url,
  });

  factory AbilityData.fromJson(Map<String, dynamic> json) =>
      _$AbilityDataFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityDataToJson(this);

  final String name;
  final String url;
}
