import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  final int id;
  const SecondScreen({required this.name, this.id = 1, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: MaterialButton(
        onPressed: () => context.read<ThemeProvider>().toggleAppTheme(),
        child: Text(
          '$name--$id',
          style: TextStyle(color: ThemeProvider.colors.customTextColor),
        ),
      ),
    );
  }
}
