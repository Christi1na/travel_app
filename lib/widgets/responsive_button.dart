import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final double? width;
  final bool isResponsive;
  final Text text;
  const ResponsiveButton({super.key, this.width, this.isResponsive= false, this.text = const Text('')});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isResponsive ? const EdgeInsets.only(left: 25) : const EdgeInsets.only(left: 0),
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor
      ),
      child: Row(
        mainAxisAlignment: isResponsive ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
        children: [
          isResponsive ? text : const Text(''),
          Image.asset('assets/images/button-one.png'),
        ],
      ),
    );
  }
}