import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/round_button.dart';
import 'package:flutter_gym/view/login/welcome_view.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  CarouselController buttonCarouselController = CarouselController();
  List goalArr = [
    {
      "image": "lib/assets/img/hedef_1.png",
      "title": "Kas Kazanmak",
      "subtitle": "Yeterli Kas Oranına\nSahip Olabilirsin"
    },
    {
      "image": "lib/assets/img/hedef_2.png",
      "title": "Mükemmel Bir Fizik",
      "subtitle": "Daha Esnek Bir Vücüda\nSahip Olabilirsin "
    },
    {
      "image": "lib/assets/img/hedef_3.png",
      "title": "Zayıflamak",
      "subtitle":
          "Fazla yağlardan Kurtulup\nDaha Güzel Bir Vücüda\nSahip Olabilirsin "
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: CarouselSlider(
              items: goalArr
                  .map(
                    (g0bj) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: TColor.primryG,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: media.width * 0.1, horizontal: 25),
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              g0bj["image"].toString(),
                              width: media.width * 0.5,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: media.width * 0.1,
                            ),
                            Text(
                              g0bj["title"].toString(),
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              g0bj["subtitle"].toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: TColor.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.75,
                aspectRatio: 0.75,
                initialPage: 0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            width: media.width,
            child: Column(
              children: [
                SizedBox(
                  // satır bosluk atma

                  height: media.width * 0.05,
                ),
                Text(
                  "Hedeflerin Neler ?",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                SizedBox(
                  height: media.width * 0.05,
                ),
                RoundButton(
                  title: "Onayla",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomView()));
                  },
                  elevation: 0,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
