import 'dart:async';
import 'dart:convert';

import 'package:fina_a_match_2/model/level.dart';
import 'package:fina_a_match_2/model/user.dart';
import 'package:fina_a_match_2/pages/difficult_page.dart';
import 'package:fina_a_match_2/pages/level_over_page.dart';
import 'package:fina_a_match_2/pages/levels_page.dart';
import 'package:fina_a_match_2/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  LevelItem level1 = LevelItem(levelNumber: 1, isCompleted: false);
  LevelItem level2 = LevelItem(levelNumber: 2, isCompleted: false);
  LevelItem level3 = LevelItem(levelNumber: 3, isCompleted: false);
  LevelItem level4 = LevelItem(levelNumber: 4, isCompleted: false);
  int matchedCard = 0;
  @override
  void initState() {
    super.initState();
    getSP(() {
      setState(() {});
    });
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
                image: const AssetImage('assets/background3.png'))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        'assets/level_table.png',
                        scale: 1.2,
                      ),
                      Positioned(
                          top: -20,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/level_small_table.png'),
                              Positioned(
                                top: 30,
                                child: Stack(
                                  children: <Widget>[
                                    Text(
                                      'LEVEL  ${game.currentLevel}',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color = const Color(0Xff59173E),
                                      ),
                                    ),
                                    Text(
                                      'LEVEL  ${game.currentLevel}',
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const Positioned(right: -120, top: 30, child: OtpTimer()),
                      Positioned(
                        top: game.currentLevel == 3
                            ? 60
                            : game.currentLevel == 4
                                ? 70
                                : game.currentLevel == 1
                                    ? 60
                                    : game.currentLevel == 2
                                        ? 70
                                        : 0,
                        child: SizedBox(
                            height:
                                game.currentLevel == 3 || game.currentLevel == 4
                                    ? 350
                                    : game.currentLevel == 1
                                        ? 200
                                        : 250,
                            width:
                                game.currentLevel == 3 || game.currentLevel == 4
                                    ? 350
                                    : game.currentLevel == 1
                                        ? 200
                                        : 250,
                            child: GridView.builder(
                                itemCount: game.gameImg!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: game.currentLevel == 3
                                      ? 4
                                      : game.currentLevel == 4
                                          ? 5
                                          : game.currentLevel == 1
                                              ? 2
                                              : 3,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                ),
                                padding: const EdgeInsets.all(16.0),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        //incrementing the clicks

                                        game.gameImg![index] =
                                            game.cards_list[index];
                                        game.matchCheck.add(
                                            {index: game.cards_list[index]});
                                      });
                                      if (game.matchCheck.length == 2) {
                                        if (game.matchCheck[0].values.first ==
                                            game.matchCheck[1].values.first) {
                                          game.matchCheck.clear();
                                          matchedCard = matchedCard + 2;
                                          if (matchedCard ==
                                              game.gameImg!.length) {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 1000), () {
                                              if (game.currentLevel ==
                                                  level1.levelNumber) {
                                                level1.isCompleted = true;
                                              } else if (game.currentLevel ==
                                                  level2.levelNumber) {
                                                level2.isCompleted = true;
                                              } else if (game.currentLevel ==
                                                  level3.levelNumber) {
                                                level3.isCompleted = true;
                                              } else if (game.currentLevel ==
                                                  level4.levelNumber) {
                                                level4.isCompleted = true;
                                              }
                                              user.money = user.money! + 125;

                                              user.hp = user.hp! - 1;
                                              addSP(level1, level2, level3,
                                                  level4, user);
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute<void>(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const LevelOver()),
                                              );
                                              setState(() {});
                                            });
                                          }
                                        } else {
                                          Future.delayed(
                                              const Duration(milliseconds: 500),
                                              () {
                                            setState(() {
                                              game.gameImg![game
                                                  .matchCheck[0]
                                                  .keys
                                                  .first] = game.hiddenCard;
                                              game.gameImg![game
                                                  .matchCheck[1]
                                                  .keys
                                                  .first] = game.hiddenCard;
                                              game.matchCheck.clear();
                                            });
                                          });
                                        }
                                      }
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            image: DecorationImage(
                                              image: AssetImage(game
                                                          .gameImg![index] !=
                                                      "assets/gameIcons/icon_container.png"
                                                  ? 'assets/gameIcons/icon_container.png'
                                                  : 'assets/gameIcons/icon_container1.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        game.gameImg![index] !=
                                                "assets/gameIcons/icon_container.png"
                                            ? Positioned(
                                                bottom: game.currentLevel == 4
                                                    ? 15
                                                    : 20,
                                                child: Image.asset(
                                                  game.gameImg![index],
                                                  scale: 1.5,
                                                ),
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  );
                                })),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addSP(LevelItem? level1, LevelItem? level2, LevelItem? level3,
      LevelItem? level4, UserItem? user) async {
    final prefs = await SharedPreferences.getInstance();

    String rawJson1 = jsonEncode(level1!.toJson());
    prefs.setString('level1', rawJson1);

    String rawJson2 = jsonEncode(level2!.toJson());
    prefs.setString('level2', rawJson2);

    String rawJson3 = jsonEncode(level3!.toJson());
    prefs.setString('level3', rawJson3);

    String rawJson4 = jsonEncode(level4!.toJson());
    prefs.setString('level4', rawJson4);

    String rawJson6 = jsonEncode(user!.toJson());
    prefs.setString('user', rawJson6);
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

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key});

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 120;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      if (mounted) {
        setState(() {
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) timer.cancel();
        });
      }
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Text(
              timerText,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                fontSize: 48,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = const Color(0Xff59173E),
              ),
            ),
            Text(
              timerText,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                fontSize: 48,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
