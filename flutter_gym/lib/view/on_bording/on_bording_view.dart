//baslangıc ekranı dortlu
import 'package:flutter/material.dart';
import 'package:flutter_gym/common_widget/on_borading_page.dart';
import 'package:flutter_gym/view/login/signup_view.dart';
import '../../common/color_extension.dart';

class OnBordingView extends StatefulWidget {
  const OnBordingView({super.key});

  @override
  State<OnBordingView> createState() => OnBordingViewState();
}

class OnBordingViewState extends State<OnBordingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Hedefe Giden Yol",
      "subtitle":
          "Eğer hedeflerinizi belirlemede zorluk yaşıyorsanız endişelenmeyin, size hedeflerinizi belirleme ve takip etme konusunda yardımcı olabiliriz.",
      "image": "lib/assets/img/bir.png",
    },
    {
      "title": "Harekete Geç",
      "subtitle":
          "Yanmaya başlayalım, hedeflerinize ulaşmak için. Sadece geçici bir acıdır, şimdi vazgeçerseniz, sonsuza kadar acı içinde olacaksınız.",
      "image": "lib/assets/img/iki.png",
    },
    {
      "title": "Sağlıklı Beslen",
      "subtitle":
          "Sağlıklı bir yaşam tarzına bizimle başlayın, her gün beslenme düzeninizi belirleyebiliriz. Sağlıklı beslenmek eğlencelidir.",
      "image": "lib/assets/img/uc.png",
    },
    {
      "title": "Uykunu Kaliteni Artır",
      "subtitle":
          "Uyku kalitenizi bizimle artırın, iyi kalitede uyku sabahları iyi bir ruh hali ve sağlıklı bir vücut demektir",
      "image": "lib/assets/img/dort.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColor.white,
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PageView.builder(
                controller: controller,
                itemCount: pageArr.length,
                itemBuilder: (context, index) {
                  var p0bj = pageArr[index] as Map? ?? {};
                  return OnBoardingPage(p0bj: p0bj);
                }),
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      color: TColor.primryColor1,
                      value: (selectPage + 1) / 4,
                      strokeWidth: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: TColor.primryColor1,
                        borderRadius: BorderRadius.circular(40)),
                    child: IconButton(
                      icon: Icon(
                        Icons
                            .navigate_next, //burası onbording page sol alt icon içi buyuktur işareti
                        color: TColor.white,
                      ),
                      onPressed: () {
                        if (pageArr.length < 3) {
                          selectPage = selectPage + 1;

                          controller.animateToPage(selectPage,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.bounceInOut);

                          //controller.jumpToPage(selectPage);

                          setState(() {});
                        } else {
                          // ignore: avoid_print
                          print("Merhaba Ekranına Geç");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpView()));
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
