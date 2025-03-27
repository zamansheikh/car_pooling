import 'package:flutter/material.dart';

class MyChildrenScreen extends StatelessWidget {
  const MyChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Children')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('My Children', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
