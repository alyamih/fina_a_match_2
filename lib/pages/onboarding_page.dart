import 'package:fina_a_match_2/pages/difficult_page.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: const AssetImage('assets/background1.png'))),
            ),
            Positioned(
              right: 40,
              top: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (page == 1) Image.asset('assets/onBoardingText1.png'),
                  if (page == 2) Image.asset('assets/onBoardingText2.png'),
                  if (page == 3) Image.asset('assets/onBoardingText3.png'),
                  InkWell(
                      onTap: () {
                        if (page < 3) {
                          page++;
                          setState(() {});
                        } else {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const DifficultPage()),
                          );
                        }
                      },
                      child: Image.asset('assets/button.png')),
                ],
              ),
            ),
            Positioned(top: 130, child: Image.asset('assets/tiger1.png'))
          ],
        ),
      ),
    );
  }
}
