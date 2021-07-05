import 'package:campskuy/utils/color_utils.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const MainButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: ColorsUtil.primaryGreen,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15)),
      child: Text(title),
    );
  }
}
