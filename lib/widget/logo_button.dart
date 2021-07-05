import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color borderColor;
  final Color textColor;

  const LogoButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.borderColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            side: BorderSide(width: 2.0, color: borderColor),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Row(
            children: [
              Image.asset(
                icon,
                height: 20,
                width: 20,
              ),
              Expanded(
                  child: Center(
                      child: Text(title,
                          style: TextStyle(
                            color: textColor,
                          ))))
            ],
          ),
        ));
  }
}
