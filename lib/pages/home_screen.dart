import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pokedex/widgets/poke_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokedex = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Text(
              'Pokedex',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: 'Google',
              ),
            ),
          ),
          pokedex.length > 0
              ? Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: pokedex.length,
                      itemBuilder: (context, index) {
                        var pokemon = pokedex[index];
                        return pokemon != null
                            ? PokeCard(index: index, pokemon: pokemon)
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )
        ]),
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        'Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((pokeList) {
      print(pokeList.statusCode);
      if (pokeList.statusCode == 200) {
        var decodedResponse = convert.jsonDecode(pokeList.body);
        pokedex = decodedResponse['pokemon'];
        setState(() {});
      }
    });
  }
}
