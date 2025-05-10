import 'package:flutter/material.dart';

import '../../shared/percentage_shared.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(title: Text('Configurações'),),
        body:ListView (
          padding: const EdgeInsets.all(8.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.local_hospital),
                  labelText: 'Valor do Psicologo',
                  ),
              keyboardType: TextInputType.numberWithOptions(),

            ),
            TextFormFieldPercentage(numberPercentage: 1,),
            TextFormFieldPercentage(numberPercentage: 2),
            TextFormFieldPercentage(numberPercentage: 3,)
          ],
        ),
        
        
      );
  }
}
