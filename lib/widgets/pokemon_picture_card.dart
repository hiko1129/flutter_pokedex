import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:url_launcher/url_launcher.dart';

class PokemonPictureCard extends StatelessWidget {
  PokemonPictureCard({
    @required String id,
    @required String name,
    @required String picturePath,
    @required String iconPath,
    @required Base base,
  })  : _name = name,
        _id = id,
        _picturePath = picturePath,
        _iconPath = iconPath,
        _base = base;

  final String _id;
  final String _name;
  final String _picturePath;
  final String _iconPath;
  final Base _base;

  @override
  Widget build(BuildContext context) {
    final chips = <String, dynamic>{
      'HP': _base.hp,
      'Attack': _base.attack,
      'Defense': _base.defense,
      'Sp. Attack': _base.spAttack,
      'Sp. Defense': _base.spDefense,
      'Speed': _base.speed,
    };

    return GestureDetector(
      onTap: () async =>
          launch('https://www.pokemon.jp/zukan/detail/$_id.html'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: Image.asset('assets/$_iconPath'),
                title: Text(_name),
              ),
              Image.asset('assets/$_picturePath'),
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
}
