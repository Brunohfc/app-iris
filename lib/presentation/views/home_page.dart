

import 'package:app_iris/presentation/views/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("data"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SettingsPage()),
                  );
                },
                child: Text(
                  "Button",
                  style: TextStyle(backgroundColor: Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}