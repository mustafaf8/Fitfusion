import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class WorkoutRow extends StatelessWidget {
  final Map w0bj;
  const WorkoutRow({super.key, required this.w0bj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            color: TColor.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                w0bj["image"].toString(),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  w0bj["name"].toString(),
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Yakılan kCal ${w0bj["kCal"].toString()} | ${w0bj["time"].toString()}",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                SimpleAnimationProgressBar(
                  height: 15,
                  width: media.width * 0.5,
                  backgroundColor: const Color.fromARGB(255, 238, 237, 237),
                  foregrondColor: const Color.fromARGB(255, 228, 74, 255),
                  ratio: 0.1,
                  direction: Axis.horizontal,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 3),
                  borderRadius: BorderRadius.circular(7.5),
                  gradientColor: const LinearGradient(colors: [
                    Color.fromARGB(255, 71, 166, 255),
                    Color.fromARGB(255, 125, 169, 226)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                ),
              ],
            )),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "lib/assets/img/Workout-Btn.png",
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            )
          ],
        ));
  }
}
