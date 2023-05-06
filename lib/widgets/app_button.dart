import 'package:flutter/material.dart';

// import '../misc/colors.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double size;
  final bool? isIcon;
  final IconData? icon;
  const AppButton({
    super.key, 
    this.text, 
    this.isIcon = false, 
    this.icon,
    required this.size, 
    required this.backgroundColor, 
    required this.borderColor,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIcon == false ? Text(text!, style: TextStyle(color: color, fontSize: 20)) : Icon(icon, color: color,),
        ],
      ),
    );
  }
}