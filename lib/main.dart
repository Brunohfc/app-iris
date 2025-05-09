import 'package:app_iris/data/models/proposta_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'core/hive/hive_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();

  var box = Hive.box<PropostaModel>(HiveInit.boxName);
  var proposta = PropostaModel(
    valorPsicologo: 200,
    porcentagem1: 10,
    porcentagem2: 15,
    porcentagem3: 20,
    porcentagemContratacao: 50,
  );
  await box.add(proposta);

  print(box.values);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("data")),
        body: Column(children: [ButtonTheme(child: Text("aaa")),


        ]),
      ),
    );
  }
}
