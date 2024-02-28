import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subway alarm',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
            ),
            Icon(
              Icons.alarm,
              color: Colors.black,
              size: 80,
            )
          ],
        ),
      ),
    );
  }
}
