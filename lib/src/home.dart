import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stateful_lifecycle_sample/src/card_game.dart';

class HomePage extends StatefulWidget {
  static List<String> cardList = const [
    'A',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'J',
    'Q',
    'K'
  ];
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int money = 400;
  List<String> initCards = [];
  void makeInitCards() {
    if (money - 100 < 0) return;
    money -= 100;
    initCards.clear();
    List.generate(3, (index) {
      var index = Random().nextInt(HomePage.cardList.length);
      var card = HomePage.cardList[index];
      initCards.add(card);
    });
    print(initCards);
    update();
  }

  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$money원'),
      ),
      body: CardGameWidget(initCards: initCards),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 20,
          right: 20,
        ),
        child: Row(children: [
          Expanded(
            child: ElevatedButton(
              onPressed: makeInitCards,
              child: const Text('한판하기 -100원'),
            ),
          ),
        ]),
      ),
    );
  }
}
