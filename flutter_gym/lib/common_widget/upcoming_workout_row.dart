import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';

class UpcomingWorkoutRow extends StatefulWidget {
  final Map wObj;
  const UpcomingWorkoutRow({super.key, required this.wObj});

  @override
  State<UpcomingWorkoutRow> createState() => _UpcomingWorkoutRowState();
}

class _UpcomingWorkoutRowState extends State<UpcomingWorkoutRow> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: TColor.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                widget.wObj["image"].toString(),
                width: 50,
                height: 50,
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
                  widget.wObj["title"].toString(),
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.wObj["time"].toString(),
                  style: TextStyle(
                    color: TColor.gray,
                    fontSize: 10,
                  ),
                ),
              ],
            )),
            AnimatedToggleSwitch<bool>.dual(
              current: positive,
              first: false,
              second: true,
              spacing: 0.1,
              style: const ToggleStyle(
                borderColor: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              borderWidth: 2,
              height: 25,
              onChanged: (b) => setState(() => positive = b),
              styleBuilder: (b) => ToggleStyle(
                  indicatorColor: b ? TColor.scondaryColor2 : TColor.gray),
              textBuilder: (value) => value
                  ? const Center(
                      child: Text(
                      'Kapa',
                      style: TextStyle(fontSize: 10),
                    ))
                  : const Center(
                      child: Text(
                      'Aç',
                      style: TextStyle(fontSize: 10),
                    )),
            ),
          ],
        ));
  }
}
