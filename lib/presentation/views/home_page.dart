import 'package:app_iris/presentation/views/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: Icon(Icons.settings)),
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'lib/data/assets/images/logo.png',
                width: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(

                      onPressed: () {}, child: Text('Recrutamento')
                  ),
                  TextButton(onPressed: () {}, child: Text('Sentris')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
