import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';

class SettingRow extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;
  const SettingRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onperessed işlemi arrowların gorevi
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, height: 19, width: 19, fit: BoxFit.contain),
            const SizedBox(
              height: 25,
              width: 5,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            
            Image.asset("lib/assets/img/Icon-Arrow.png",
                height: 18, width: 18, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
