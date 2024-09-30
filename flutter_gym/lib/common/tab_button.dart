import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final VoidCallback onTab;
  final bool isActive;
  const TabButton({
    super.key,
    required this.icon,
    required this.selectIcon,
    required this.onTab,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onTap: onTab,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isActive ? selectIcon : icon,
            height: 25,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.only(top: isActive ? 8 : 12),
          ),
          if (isActive)
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: TColor.scondaryG),
                  shape: BoxShape.circle,
            )
        ],
      ),
    );
  }
}
