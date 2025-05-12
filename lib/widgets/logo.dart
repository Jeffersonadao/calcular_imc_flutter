import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final String imagePath;
  final double width;
  const LogoImage({super.key, required this.imagePath, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Image.asset(imagePath, width: width),
      ),
    );
  }
}
