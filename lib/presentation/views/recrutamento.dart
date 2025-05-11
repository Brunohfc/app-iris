import 'package:flutter/material.dart';

class Recrutamento extends StatelessWidget {
  const Recrutamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recrutamento'),),
        body: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Image.asset(
              'lib/data/assets/images/logo.png',
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Salário bruto',
                  icon: Icon(Icons.attach_money)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){}, child: Text('Calcular'))
              ],
            )
          ],
        ), 
    );
  }
}
