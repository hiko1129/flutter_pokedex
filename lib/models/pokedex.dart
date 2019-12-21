import 'package:json_annotation/json_annotation.dart';

part 'pokedex.g.dart';

@JsonSerializable()
class Pokedex {
  Pokedex({
    this.id,
    this.name,
    this.type,
    this.base,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) =>
      _$PokedexFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexToJson(this);

  int id;
  Name name;
  List<String> type;
  Base base;
}

@JsonSerializable()
class Name {
  Name({
    this.english,
    this.japanese,
    this.chinese,
    this.french,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);

  String english;
  String japanese;
  String chinese;
  String french;
}

class BaseKeys {
  static const hp = 'hp';
  static const attack = 'attack';
  static const defense = 'defense';
  static const spAttack = 'spAttack';
  static const spDefense = 'spDefense';
  static const speed = 'speed';
}

@JsonSerializable()
class Base {
  Base({
    this.hp,
    this.attack,
    this.defense,
    this.spAttack,
    this.spDefense,
    this.speed,
  });

  factory Base.fromJson(Map<String, dynamic> json) => _$BaseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseToJson(this);

  @JsonKey(name: 'HP')
  int hp;
  @JsonKey(name: 'Attack')
  int attack;
  @JsonKey(name: 'Defense')
  int defense;
  @JsonKey(name: 'Sp. Attack')
  int spAttack;
  @JsonKey(name: 'Sp. Defense')
  int spDefense;
  @JsonKey(name: 'Speed')
  int speed;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      BaseKeys.hp: hp,
      BaseKeys.attack: attack,
      BaseKeys.defense: defense,
      BaseKeys.spAttack: spAttack,
      BaseKeys.spDefense: spDefense,
      BaseKeys.speed: speed,
    };
  }
}
