import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subway alarm',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.alarm,
            color: Colors.black,
            size: 80,
          )
        ],
      ),
    );
  }
}
