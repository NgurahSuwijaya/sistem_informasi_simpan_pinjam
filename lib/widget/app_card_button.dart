import 'package:flutter/material.dart';

class AppCardButton extends StatelessWidget {
  const AppCardButton(
      {super.key, required this.icon, this.onPressed, required this.color});

  final Icon icon;
  final Color color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: Colors.blueGrey,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          color: color,
          iconSize: 30,
        ),
      ),
    );
  }
}
