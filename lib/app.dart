import 'package:flutter/material.dart';
import 'package:pokedex/screens/main_screen.dart';
import 'package:pokedex/utils/load_assets.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Assets>(
      future: loadAssets(context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Provider<Assets>(
          create: (_) => snapshot.data,
          child: MaterialApp(
            title: 'pokedex',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            initialRoute: MainScreen.path,
            routes: {
              MainScreen.path: (context) => MainScreen(),
            },
          ),
        );
      },
    );
  }
}
