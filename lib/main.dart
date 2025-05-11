import 'package:app_iris/data/providers/proposta_provider.dart';
import 'package:app_iris/presentation/views/home_page.dart';
import 'package:app_iris/presentation/views/planos/plano_dois.dart';
import 'package:app_iris/presentation/views/planos/plano_tres.dart';
import 'package:app_iris/presentation/views/planos/plano_um.dart';
import 'package:app_iris/presentation/views/recrutamento.dart';
import 'package:app_iris/presentation/views/sentiris.dart';
import 'package:app_iris/presentation/views/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/hive/hive_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PropostaProvider()),
      ],
      child: MyApp(),
    ),
    //Provider
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/settings': (context) => SettingsPage(),
        '/sentiris': (context) => SentirisPage(),
        '/recrutamento': (context) => Recrutamento(),
        '/planoUm' : (context) => PlanoUm(),
        'planoDois' : (context) => PlanoDois(),
        'planoTres' : (context) => PlanoTres()
      },
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue,
          )),
      home: HomePage(),
    );
  }
}
