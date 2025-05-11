
import 'package:app_iris/data/models/proposta_model.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveInit{

  static const String boxName = 'proposta_box';

  static Future<void> init() async{

    final boxDirectory = await getApplicationDocumentsDirectory();

    Hive.init(boxDirectory.path);

    Hive.registerAdapter(PropostaModelAdapter());

    await Hive.openBox<PropostaModel>(boxName);
  }
}