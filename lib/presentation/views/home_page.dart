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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'lib/data/assets/images/image_iris.png',
                width: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/recrutamento');
                        }, child: Text('Recrutamento')
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextButton(

                        onPressed: () {
                      Navigator.pushNamed(context, '/sentiris');
                    }, child: Text('Sentiris')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
