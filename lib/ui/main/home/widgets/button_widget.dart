import 'package:flutter/material.dart';

class RaisedButtonCustomWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onPressed;
  final Color borderColor;

  const RaisedButtonCustomWidget({
    Key? key,
    required this.icon,
    this.text = '',
    this.onPressed,
    this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: borderColor,
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
