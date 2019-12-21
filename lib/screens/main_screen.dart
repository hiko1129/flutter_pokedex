import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/utils/load_assets.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/widgets/pokemon_picture_card.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  static const path = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Assets _assets;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _assets = Provider.of<Assets>(context);
  }

  Widget _buildList(List<Pokedex> pokedex) {
    final numberFormat = NumberFormat('000');

    return ListView.builder(
      itemBuilder: (context, index) {
        final pokemon = pokedex[index];

        return PokemonPictureCard(
          name: pokemon.name.english,
          base: pokemon.base,
          picturePath: 'pokemon/images/${numberFormat.format(pokemon.id)}.png',
          iconPath: 'pokemon/sprites/${numberFormat.format(pokemon.id)}MS.png',
        );
      },
      itemCount: pokedex.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pokedex = _assets.pokedex;

    return Scaffold(
      appBar: AppBar(
        title: const Text('図鑑'),
      ),
      body: _buildList(pokedex),
    );
  }
}
