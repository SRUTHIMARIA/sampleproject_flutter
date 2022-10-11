import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {
  final String name;
  final int id;
  const SecondScreen({required this.name, this.id = 1, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Container(),

    );
  }
}
