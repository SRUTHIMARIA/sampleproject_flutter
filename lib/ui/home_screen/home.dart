import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/services/navigation/router.gr.dart';
import '../../providers/theme_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Template')),
      body: MaterialButton(
        onPressed: () => context.router.push(SecondScreen(name: 'change theme', id: 2)),
        child: Text(
          'Go to second page',
          style: TextStyle(color: ThemeProvider.colors.customTextColor),
        ),
      ),
    );
  }
}
