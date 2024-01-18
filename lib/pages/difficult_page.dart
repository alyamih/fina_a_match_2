import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fina_a_match_2/model/user.dart';
import 'package:fina_a_match_2/pages/levels_page.dart';
import 'package:fina_a_match_2/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

UserItem user = UserItem(hp: 4, money: 0);

class DifficultPage extends StatefulWidget {
  const DifficultPage({super.key});

  @override
  State<DifficultPage> createState() => _DifficultPageState();
}

class _DifficultPageState extends State<DifficultPage> {
  CarouselController carouselController = CarouselController();
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
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/background2.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              child: CarouselSlider(
                  carouselController: carouselController,
                  items: getLevelsDifficulty(),
                  options: CarouselOptions(
                    // /aspectRatio: 1,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        carouselController.previousPage();
                      },
                      child: Image.asset('assets/past.png')),
                  const SizedBox(
                    width: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const LevelsPage()),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/start.png'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  InkWell(
                      onTap: () {
                        carouselController.nextPage();
                      },
                      child: Image.asset('assets/next.png'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getLevelsDifficulty() {
    List<Widget> list = [];
    list.add(Image.asset('assets/simple.png'));
    list.add(Image.asset('assets/middle.png'));
    list.add(Image.asset('assets/hard.png'));
    return list;
  }

  void getSP(Function() callback) async {
    final prefs = await SharedPreferences.getInstance();

    final rawJson6 = prefs.getString('user') ?? '';

    Map<String, dynamic> map6 = {};

    if (rawJson6.isNotEmpty) {
      map6 = jsonDecode(rawJson6);
    }

    if (map6.isNotEmpty) {
      user = UserItem.fromJson(map6);
    }
    callback();
  }
}
