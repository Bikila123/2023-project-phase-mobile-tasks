import 'package:flutter/material.dart';
import 'package:flutter_tutorial/learn_flutter_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const LearnFlutterPage();
              }
            ),
          );
        },
        child: const Text("Home Page"),
      ),
    );
  }
}
