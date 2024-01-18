import 'package:fina_a_match_2/pages/difficult_page.dart';
import 'package:fina_a_match_2/pages/levels_page.dart';
import 'package:fina_a_match_2/pages/settings_page.dart';
import 'package:flutter/material.dart';

class LevelOver extends StatelessWidget {
  const LevelOver({super.key});

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
              padding: const EdgeInsets.only(top: 12, left: 30, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/level_small_table.png'),
                        Positioned(
                          top: 30,
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'LEVEL ${game.currentLevel} IS OVER!',
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
                                'LEVEL ${game.currentLevel} IS OVER!',
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
                    ),
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
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Image.asset('assets/tiger.png'),
                Positioned(
                    bottom: -10,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const LevelsPage()),
                          );
                        },
                        child: Image.asset('assets/continue.png'))),
                Positioned(
                    right: -130, child: Image.asset('assets/add_money.png'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
