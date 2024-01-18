import 'package:fina_a_match_2/pages/difficult_page.dart';
import 'package:fina_a_match_2/pages/show_screen.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/background3.png'))),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/home.png')),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset('assets/settings_table.png'),
                        Positioned(
                          top: 130,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 45),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const ReadTermsOrPrivacyScreenView(
                                                link: 'google.com',
                                              )),
                                    );
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Text(
                                        'PRIVACY POLICY',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Trispace',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 7
                                            ..color = const Color(0Xff59173E),
                                        ),
                                      ),
                                      const Text(
                                        'PRIVACY POLICY',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Trispace',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 45),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const ReadTermsOrPrivacyScreenView(
                                                link: 'google.com',
                                              )),
                                    );
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Text(
                                        'TERMS OF USE',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Trispace',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 7
                                            ..color = const Color(0Xff59173E),
                                        ),
                                      ),
                                      const Text(
                                        'TERMS OF USE',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Trispace',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Text(
                                    'RATE APP',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Trispace',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 7
                                        ..color = const Color(0Xff59173E),
                                    ),
                                  ),
                                  const Text(
                                    'RATE APP',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Trispace',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        left: 5,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('assets/setting.png'),
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Text(
                                  'SETTINGS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Trispace',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 7
                                      ..color = const Color(0Xff59173E),
                                  ),
                                ),
                                const Text(
                                  'SETTINGS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Trispace',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
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
                          right: 50, child: Image.asset('assets/money.png')),
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
      ),
    );
  }
}
