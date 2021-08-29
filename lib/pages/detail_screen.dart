import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/widgets/info_row.dart';
import 'package:pokedex/widgets/type_pill.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.heroTag,
    required this.pokemonDetail,
    required this.color,
  }) : super(key: key);

  final heroTag;
  final pokemonDetail;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          elevation: 0,
          title: Align(
              alignment: Alignment.centerRight,
              child: Text('#${pokemonDetail['num']}',
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                  ))),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: color,
            width: width,
            child: Stack(
              children: [
                Opacity(
                  child: Image.asset('assets/pokeball.png'),
                  opacity: .1,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pokemonDetail['name'],
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Google',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  TypePill(type: pokemonDetail['type'][0]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Hero(
                      tag: heroTag,
                      child: CachedNetworkImage(
                        height: 250,
                        width: 250,
                        imageUrl:
                            'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${pokemonDetail['num']}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(children: [
                            SizedBox(
                              height: 40,
                            ),
                            InfoRow(
                              label: 'Name',
                              info: pokemonDetail['name'],
                            ),
                            InfoRow(
                              label: 'Type',
                              info: pokemonDetail['type'].join(', '),
                            ),
                            InfoRow(
                              label: 'Weight',
                              info: pokemonDetail['weight'],
                            ),
                            InfoRow(
                              label: 'Height',
                              info: pokemonDetail['height'],
                            ),
                            InfoRow(
                              label: 'Spawn time',
                              info: pokemonDetail['spawn_time'],
                            ),
                            InfoRow(
                              label: 'Weaknesses',
                              info: pokemonDetail['weaknesses'].join(', '),
                            ),
                            InfoRow(
                              label: 'Previous',
                              info: pokemonDetail['prev_evolution'] != null
                                  ? pokemonDetail['prev_evolution'][0]['name']
                                  : '--',
                            ),
                            InfoRow(
                              label: 'Next',
                              info: pokemonDetail['next_evolution'] != null
                                  ? pokemonDetail['next_evolution'][0]['name']
                                  : '--',
                            ),
                          ]),
                        ),
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
