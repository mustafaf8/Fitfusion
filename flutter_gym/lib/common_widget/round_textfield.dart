import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';

class RoundTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final String icon;
  final Widget? rightIcon;
  final bool obscureText;
  final EdgeInsets? margin;

  const RoundTextField({
    super.key,
    required this.hitText,
    required this.icon,
    this.controller,
    this.margin,
    this.keyboardType,
    this.obscureText = false,
    this.rightIcon,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RoundTextFieldState createState() => _RoundTextFieldState();
}

class _RoundTextFieldState extends State<RoundTextField> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: TColor.lightgray,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: widget.hitText,
          suffixIcon: _buildSuffixIcon(),
          prefixIcon: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            child: Image.asset(
              widget.icon,
              width: 15,
              height: 15,
              fit: BoxFit.contain,
              color: TColor.gray,
            ),
          ),
          hintStyle: TextStyle(color: TColor.gray, fontSize: 12),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.rightIcon != null) {
      return widget.rightIcon;
    } else if (widget.obscureText) {
      return IconButton(
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    } else {
      return null;
    }
  }
}
