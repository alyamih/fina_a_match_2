import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fina_a_match_2/main.dart';
import 'package:fina_a_match_2/pages/difficult_page.dart';
import 'package:fina_a_match_2/pages/onboarding_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1000,
      splashIconSize: double.infinity,
      splash: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: const AssetImage('assets/background1.png'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text(
                    'TIGER TRIP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Trispace',
                      fontWeight: FontWeight.w900,
                      fontSize: 68,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 10
                        ..color = const Color(0Xff59173E),
                    ),
                  ),
                  const Text(
                    'TIGER TRIP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Trispace',
                      fontWeight: FontWeight.w900,
                      fontSize: 68,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      nextScreen: initScreen == 0 || initScreen == null
          ? const OnBoarding()
          : const DifficultPage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
