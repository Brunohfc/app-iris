import 'package:app_iris/data/providers/proposta_provider.dart';
import 'package:app_iris/shared/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{

  final _formKey = GlobalKey<FormState>();


  late TextEditingController _psicologoController;
  late TextEditingController _porcentagemUm;
  late TextEditingController _porcentagemDois;
  late TextEditingController _porcentagemTres;
  late TextEditingController _porcentagemContratacao;


  @override
  void initState(){
    super.initState();

    _psicologoController = TextEditingController();
    _porcentagemUm = TextEditingController();
    _porcentagemDois = TextEditingController();
    _porcentagemTres = TextEditingController();
    _porcentagemContratacao = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      final provider = context.read<PropostaProvider>();
      final dados = provider.carregarUltimaProposta();

      _psicologoController.text = provider.valorPsicologo.toString();
      _porcentagemUm.text = provider.porcentagemUmFormatada.toStringAsFixed(2);
      _porcentagemDois.text = provider.porcentagemDoisFormatada.toStringAsFixed(2);
      _porcentagemTres.text = provider.porcentagemTresFormatada.toStringAsFixed(2);
      _porcentagemContratacao.text = provider.porcentagemContratacaoFormatada.toStringAsFixed(2);
    });

  }

@override
void dispose(){
  _psicologoController.dispose();
  _porcentagemUm.dispose();
  _porcentagemDois.dispose();
  _porcentagemTres.dispose();
  _porcentagemContratacao.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    final provider = context.read<PropostaProvider>();


    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            CustomPadding(),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Este campo é obrigatório';
                }
                return null;
              },
              controller: _psicologoController,
              decoration: const InputDecoration(
                icon: Icon(Icons.local_hospital),
                labelText: 'Valor do Psicologo',
              ),
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) =>
                  context.read<PropostaProvider>().setValorPsicologo(value),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Este campo é obrigatório';
                }
                return null;
              },
              controller: _porcentagemUm,
              decoration: const InputDecoration(
                icon: Icon(Icons.percent),
                labelText: 'Porcentagem 1',
              ),
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) =>
                  context.read<PropostaProvider>().setPorcentagemUm(value),
            ),
            CustomPadding(),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Este campo é obrigatório';
                }
                return null;
              },
              controller: _porcentagemDois,
              decoration: const InputDecoration(
                icon: Icon(Icons.percent),
                labelText: 'Porcentagem 2',
              ),
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) =>
                  context.read<PropostaProvider>().setPorcentagemDois(value),
            ),
            CustomPadding(),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Este campo é obrigatório';
                }
                return null;
              },
              controller: _porcentagemTres,
              decoration: const InputDecoration(
                icon: Icon(Icons.percent),
                labelText: 'Porcentagem 3',
              ),
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) =>
                  context.read<PropostaProvider>().setPorcentagemTres(value),
            ),
            CustomPadding(),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Este campo é obrigatório';
                }
                return null;
              },
              controller: _porcentagemContratacao,
              decoration: const InputDecoration(
                icon: Icon(Icons.percent),
                labelText: 'Porcentagem por contratação',
              ),
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) => context
                  .read<PropostaProvider>()
                  .setPorcentagemContratacao(value),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton.icon(
                icon: Icon(Icons.done),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(120, 30),
                    iconColor: Colors.white),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Dados salvos"),
                    ));
                  }

                  provider.setValorPsicologo(_psicologoController.text);
                  provider.setPorcentagemUm(_porcentagemUm.text);
                  provider.setPorcentagemDois(_porcentagemDois.text);
                  provider.setPorcentagemTres(_porcentagemTres.text);
                  provider.setPorcentagemContratacao(_porcentagemContratacao.text);

                  await provider.salvarProposta();
                },
                label: Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
