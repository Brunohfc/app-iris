

import 'package:app_iris/data/models/proposta_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveInit{

  static const String boxName = 'proposta_box';

  static Future<void> init() async{
    await Hive.initFlutter();

    //file auto generated after running **dart run build_runner build**
    Hive.registerAdapter(PropostaModelAdapter());

    await Hive.openBox<PropostaModel>(boxName);
  }
}