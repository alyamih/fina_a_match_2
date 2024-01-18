import 'dart:async';
import 'dart:convert';

import 'package:fina_a_match_2/model/game.dart';
import 'package:fina_a_match_2/model/level.dart';
import 'package:fina_a_match_2/model/user.dart';
import 'package:fina_a_match_2/pages/difficult_page.dart';
import 'package:fina_a_match_2/pages/level_page.dart';
import 'package:fina_a_match_2/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

GameModel game = GameModel();

class LevelsPage extends StatefulWidget {
  const LevelsPage({super.key});

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  LevelItem level1 = LevelItem(levelNumber: 1, isCompleted: false);
  LevelItem level2 = LevelItem(levelNumber: 2, isCompleted: false);
  LevelItem level3 = LevelItem(levelNumber: 3, isCompleted: false);
  LevelItem level4 = LevelItem(levelNumber: 4, isCompleted: false);
  Timer? timer;
  @override
  void initState() {
    super.initState();
    game.currentLevel = null;
    getSP(() {
      setState(() {});
    });
    timer = Timer.periodic(
      const Duration(minutes: 60),
      (timer) {
        /// callback will be executed every 1 second, increament a count value
        /// on each callback
        if (user.hp! < 5) {
          setState(() {
            user.hp = user.hp! + 1;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.darken),
                fit: BoxFit.cover,
                image: const AssetImage('assets/background2.png'))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const SettingsPage()),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                  right: -20,
                                  top: -10,
                                  child: Image.asset('assets/grass.png')),
                              Image.asset('assets/settings.png'),
                            ],
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                  right: -20,
                                  top: -10,
                                  child: Image.asset('assets/grass.png')),
                              Image.asset('assets/home.png'),
                            ],
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.centerLeft,
                          children: [
                            Positioned(
                                right: -20,
                                top: -15,
                                child: Image.asset('assets/grass.png')),
                            Image.asset('assets/hp_container.png'),
                            Positioned(
                                right: 35, child: Image.asset('assets/hp.png')),
                            Positioned(
                              right: 15,
                              bottom: 8,
                              child: Stack(
                                children: <Widget>[
                                  Text(
                                    user.hp.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 6
                                        ..color = const Color(0Xff59173E),
                                    ),
                                  ),
                                  Text(
                                    user.hp.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned(
                              right: -20,
                              top: -15,
                              child: Image.asset('assets/grass.png')),
                          Image.asset('assets/money_container.png'),
                          Positioned(
                              right: 50,
                              child: Image.asset('assets/money.png')),
                          Positioned(
                            right: 15,
                            bottom: 8,
                            child: Stack(
                              children: <Widget>[
                                Text(
                                  user.money.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = const Color(0Xff59173E),
                                  ),
                                ),
                                Text(
                                  user.money.toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 50),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Image.asset('assets/Vector.png'),
                  Positioned(
                      left: -50,
                      top: 45,
                      child: InkWell(
                          onTap: () {
                            if (user.hp != 0) {
                              if (!level1.isCompleted!) {
                                game.currentLevel = level1.levelNumber;
                                game.initCards();
                                game.initGame();
                                setState(() {});
                              }
                            } else {
                              hpDialog(context);
                            }
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.topCenter,
                            children: [
                              Image.asset('assets/level1.png'),
                              if (level1.isCompleted!)
                                Positioned(
                                    top: -5,
                                    child: Image.asset('assets/Star.png')),
                            ],
                          ))),
                  Positioned(
                      left: -15,
                      top: -50,
                      child: InkWell(
                          onTap: () {
                            if (user.hp != 0) {
                              if (!level2.isCompleted!) {
                                game.currentLevel = level2.levelNumber;
                                game.initCards();
                                game.initGame();
                                setState(() {});
                              }
                            } else {
                              hpDialog(context);
                            }
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.topCenter,
                            children: [
                              Image.asset('assets/level2.png'),
                              if (level2.isCompleted!)
                                Positioned(
                                    top: 5,
                                    left: 60,
                                    child: Image.asset('assets/Star.png')),
                            ],
                          ))),
                  Positioned(
                      left: 100,
                      top: 30,
                      child: InkWell(
                          onTap: () {
                            if (user.hp != 0) {
                              if (!level3.isCompleted!) {
                                game.currentLevel = level3.levelNumber;
                                game.initCards();
                                game.initGame();
                                setState(() {});
                              }
                            } else {
                              hpDialog(context);
                            }
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.topCenter,
                            children: [
                              Image.asset('assets/level3.png'),
                              if (level3.isCompleted!)
                                Positioned(
                                    top: 5,
                                    left: 60,
                                    child: Image.asset('assets/Star.png')),
                            ],
                          ))),
                  Positioned(
                      left: 170,
                      top: -60,
                      child: InkWell(
                          onTap: () {
                            if (user.hp != 0) {
                              if (!level4.isCompleted!) {
                                game.currentLevel = level4.levelNumber;
                                game.initCards();
                                game.initGame();
                                setState(() {});
                              }
                            } else {
                              hpDialog(context);
                            }
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.topCenter,
                            children: [
                              Image.asset('assets/level4.png'),
                              if (level4.isCompleted!)
                                Positioned(
                                    top: 5,
                                    left: 60,
                                    child: Image.asset('assets/Star.png')),
                            ],
                          ))),
                  Positioned(
                      left: 260,
                      top: 30,
                      child: InkWell(
                          onTap: () {
                            hpDialog(context);
                          },
                          child: Image.asset('assets/level5.png'))),
                  Positioned(
                      left: 350,
                      top: -60,
                      child: InkWell(
                          onTap: () {
                            hpDialog(context);
                          },
                          child: Image.asset('assets/level6.png'))),
                  Positioned(
                      left: 445,
                      top: 30,
                      child: InkWell(
                          onTap: () {
                            hpDialog(context);
                          },
                          child: Image.asset('assets/level7.png'))),
                  Positioned(
                      left: 550,
                      top: -60,
                      child: InkWell(
                          onTap: () {
                            hpDialog(context);
                          },
                          child: Image.asset('assets/level9.png'))),
                  Positioned(
                      left: 590,
                      top: 40,
                      child: InkWell(
                          onTap: () {
                            hpDialog(context);
                          },
                          child: Image.asset('assets/level8.png'))),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: InkWell(
                    onTap: () {
                      if (game.currentLevel != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LevelPage()),
                        );
                      }
                    },
                    child: Stack(
                      children: [
                        Image.asset('assets/start_game_grass.png'),
                        if (game.currentLevel == null)
                          Positioned(
                            left: 13,
                            top: 15,
                            child: Container(
                              width: 281,
                              height: 76,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3)),
                            ),
                          )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void hpDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              'Not enough HP.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17,
              ),
            ),
            content: Text(
              'Please, wait an hour.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17,
              ),
            ),
            actions: [
              Card(
                color: Colors.transparent,
                elevation: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                        child: const Text(
                          'Ok',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void getSP(Function() callback) async {
    final prefs = await SharedPreferences.getInstance();
    final rawJson1 = prefs.getString('level1') ?? '';
    final rawJson2 = prefs.getString('level2') ?? '';
    final rawJson3 = prefs.getString('level3') ?? '';
    final rawJson4 = prefs.getString('level4') ?? '';
    final rawJson6 = prefs.getString('user') ?? '';
    Map<String, dynamic> map1 = {};
    Map<String, dynamic> map2 = {};
    Map<String, dynamic> map3 = {};
    Map<String, dynamic> map4 = {};
    Map<String, dynamic> map6 = {};
    if (rawJson1.isNotEmpty) {
      map1 = jsonDecode(rawJson1);
    }
    if (rawJson2.isNotEmpty) {
      map2 = jsonDecode(rawJson2);
    }
    if (rawJson3.isNotEmpty) {
      map3 = jsonDecode(rawJson3);
    }
    if (rawJson4.isNotEmpty) {
      map4 = jsonDecode(rawJson4);
    }

    if (rawJson6.isNotEmpty) {
      map6 = jsonDecode(rawJson6);
    }
    if (map1.isNotEmpty) {
      level1 = LevelItem.fromJson(map1);
    }
    if (map2.isNotEmpty) {
      level2 = LevelItem.fromJson(map2);
    }
    if (map3.isNotEmpty) {
      level3 = LevelItem.fromJson(map3);
    }
    if (map4.isNotEmpty) {
      level4 = LevelItem.fromJson(map4);
    }

    if (map6.isNotEmpty) {
      user = UserItem.fromJson(map6);
    }
    callback();
  }
}
