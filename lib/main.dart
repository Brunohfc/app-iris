import 'package:app_iris/data/datasources/local/proposta_local.dart';
import 'package:app_iris/data/models/proposta_model.dart';
import 'package:app_iris/presentation/views/home_page.dart';
import 'package:app_iris/presentation/views/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'core/hive/hive_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();

  final datasource = PropostaLocal();

  final proposta = PropostaModel(
      valorPsicologo: 100,
      porcentagem1: 10,
      porcentagem2: 20,
      porcentagem3: 30,
      porcentagemContratacao: 25);

  //await datasource.adicionarProposta(proposta);

  runApp(
    //Provider
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iris',
      home: HomePage(),
    );
  }
}
