import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class OnBoardingPage extends StatelessWidget {
  final Map p0bj;
  const OnBoardingPage({super.key, required this.p0bj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            p0bj["image"].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: media.width * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              p0bj["title"].toString(),
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              p0bj["subtitle"].toString(),
              style: TextStyle(
                color: TColor.gray,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
