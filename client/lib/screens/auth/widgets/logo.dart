import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/logo.png',
      alignment: Alignment.center,
      width: double.infinity,
      height: 200,
    );
  }
}