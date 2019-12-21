import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex_content.dart';
import 'package:pokedex/utils/load_assets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Widget _buildList(List<PokedexContent> pokedex) {
    final numberFormat = NumberFormat('000');

    return ListView.builder(
      itemBuilder: (context, index) {
        final pokemon = pokedex[index];

        final pokemonId = numberFormat.format(pokemon.id);

        return _buildPokemonCard(
          id: pokemonId,
          name: pokemon.name.english,
          base: pokemon.base,
          picturePath: 'pokemon/images/$pokemonId.png',
          iconPath: 'pokemon/sprites/${pokemonId}MS.png',
        );
      },
      itemCount: pokedex.length,
    );
  }

  Widget _buildPokemonCard({
    @required String id,
    @required String name,
    @required String picturePath,
    @required String iconPath,
    @required Base base,
  }) {
    final chips = <String, dynamic>{
      'HP': base.hp,
      'Attack': base.attack,
      'Defense': base.defense,
      'Sp. Attack': base.spAttack,
      'Sp. Defense': base.spDefense,
      'Speed': base.speed,
    };

    const pathPrefix = 'assets';

    return GestureDetector(
      onTap: () async => launch('https://www.pokemon.jp/zukan/detail/$id.html'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: Image.asset('$pathPrefix/$iconPath'),
                title: Text(name),
              ),
              Image.asset('$pathPrefix/$picturePath'),
              Wrap(
                children: <Widget>[
                  ...chips.keys.map((chipLabel) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Chip(
                        label: Text('$chipLabel: ${chips[chipLabel]}'),
                      ),
                    );
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pokedex = _assets.pokedex;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: _buildList(pokedex),
    );
  }
}
