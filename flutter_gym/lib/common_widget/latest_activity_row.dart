import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';

class LatestActivityRow extends StatelessWidget {
  final Map w0bj;
  const LatestActivityRow({super.key, required this.w0bj});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            //ClipRRect Genellikle, dikdörtgen bir widgetin (örneğin, bir resim veya bir konteynır) köşelerini yuvarlamak için kullanılır.
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                w0bj["image"].toString(),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            //Bir Expanded widget'i, çocuk widget'in boyutunu, mevcut sütun veya satırın boyutuna göre genişletir veya daraltır
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  w0bj["title"].toString(),
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  w0bj["time"].toString(),
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
            //IconButton(
            //onPressed: () {},
            //icon: Image.asset(
            //"lib/assets/img/Workout-Btn.png",
            // width: 20,
            //height: 20,
            //fit: BoxFit.contain,
            //),
            //)
          ],
        ));
  }
}
