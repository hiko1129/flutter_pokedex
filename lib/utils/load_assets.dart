import 'dart:convert';

import 'package:pokedex/models/pokedex.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class Assets {
  Assets({@required this.pokedex}) : assert(pokedex != null);

  final List<Pokedex> pokedex;
}

Future<dynamic> _loadJsonAsset({
  @required BuildContext context,
  @required String filePath,
}) async {
  return json.decode(await DefaultAssetBundle.of(context).loadString(filePath));
}

Future<Assets> loadAssets(BuildContext context) async {
  final pokedexJson = (await _loadJsonAsset(
    context: context,
    filePath: 'assets/pokemon/pokedex.json',
  ) as List)
      .cast<Map<String, dynamic>>();

  final pokedex = pokedexJson.map((json) => Pokedex.fromJson(json)).toList();

  return Assets(pokedex: pokedex);
}
