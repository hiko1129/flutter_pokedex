// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokedex _$PokedexFromJson(Map<String, dynamic> json) {
  return Pokedex(
    id: json['id'] as int,
    name: json['name'] == null
        ? null
        : Name.fromJson(json['name'] as Map<String, dynamic>),
    type: (json['type'] as List)?.map((dynamic e) => e as String)?.toList(),
    base: json['base'] == null
        ? null
        : Base.fromJson(json['base'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokedexToJson(Pokedex instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'base': instance.base,
    };

Name _$NameFromJson(Map<String, dynamic> json) {
  return Name(
    english: json['english'] as String,
    japanese: json['japanese'] as String,
    chinese: json['chinese'] as String,
    french: json['french'] as String,
  );
}

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'english': instance.english,
      'japanese': instance.japanese,
      'chinese': instance.chinese,
      'french': instance.french,
    };

Base _$BaseFromJson(Map<String, dynamic> json) {
  return Base(
    hp: json['HP'] as int,
    attack: json['Attack'] as int,
    defense: json['Defense'] as int,
    spAttack: json['Sp. Attack'] as int,
    spDefense: json['Sp. Defense'] as int,
    speed: json['Speed'] as int,
  );
}

Map<String, dynamic> _$BaseToJson(Base instance) => <String, dynamic>{
      'HP': instance.hp,
      'Attack': instance.attack,
      'Defense': instance.defense,
      'Sp. Attack': instance.spAttack,
      'Sp. Defense': instance.spDefense,
      'Speed': instance.speed,
    };
