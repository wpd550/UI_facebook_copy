import 'dart:ffi';

import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton(
      {Key? key, required this.data, required this.iconSize, this.press})
      : super(key: key);
  final IconData data;
  final double iconSize;

  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: iconSize,
        onPressed: press,
        icon: Icon(data),
        color: Colors.black,
      ),
    );
  }
}
