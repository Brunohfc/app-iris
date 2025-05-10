import 'package:flutter/material.dart';

class TextFormFieldPercentage extends StatelessWidget {

  final String? percentage = 'Porcentagem';
  int numberPercentage;

  TextFormFieldPercentage({super.key,
    required this.numberPercentage
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
          labelText: '$percentage $numberPercentage',
          icon: const Icon(Icons.percent),
      ),
    );
  }
}
