import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/view/on_bording/on_bording_view.dart';
import '../../common_widget/round_button.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
          width: media.width,
          decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                    colors: TColor.primryG,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "FitFusion",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Bizimle Farkı Göreceksin",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              //Başlayalım butonu

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 25), //butonun konumu

                  child: RoundButton(
                    title: "Başlayalım",
                    type: isChangeColor
                        ? RoundButtonType.textGradient
                        : RoundButtonType.bgGradient,
                    onPressed: () {
                      if (isChangeColor) {
                        //bir sonraki ekrana gec
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnBordingView()));
                      } else {
                        setState(() {
                          isChangeColor = true;
                        });
                      }
                    },
                    elevation: 0,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
