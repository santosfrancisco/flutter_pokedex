import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/colors.dart';
import 'package:pokedex/pages/detail_screen.dart';
import 'package:pokedex/widgets/type_pill.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({
    Key? key,
    required this.index,
    required this.pokemon,
  }) : super(key: key);

  final index;
  final pokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonTypesList = pokemon['type'] as List<dynamic>;
    final pokeColor = PokeColors.colors[pokemonTypesList[0]] ?? Colors.grey;
    return Card(
      color: pokeColor,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(
                heroTag: index,
                pokemonDetail: pokemon,
                color: pokeColor,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 80,
              child: Opacity(
                child: Image.asset(
                  'assets/pokeball.png',
                  width: 150,
                  height: 150,
                ),
                opacity: .1,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 24, left: 8, right: 8, bottom: 24),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          pokemon!['name'],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Google',
                          ),
                        ),
                      ),
                      TypePill(type: pokemonTypesList[0]),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Hero(
                        tag: index,
                        child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          height: 100,
                          imageUrl:
                              'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${pokemon['num']}.png',
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
