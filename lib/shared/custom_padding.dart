import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
  const CustomPadding({super.key});

  @override
  Widget build(BuildContext context) {

    return const Padding(padding: EdgeInsets.only(
      top: 10,
      bottom: 10,
    ));
  }
}
