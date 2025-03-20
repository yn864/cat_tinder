import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  LikeButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}