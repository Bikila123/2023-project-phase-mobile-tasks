import 'package:add_task/todo_list.dart';
import 'package:flutter/material.dart';

import 'create_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEE6F57)),
        useMaterial3: true,
      ),
      home: TodoList(), //change to MyHomePage() for home page  until routing will be done
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      backgroundColor: const Color(0xFFEE6F57),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             const SizedBox(height: 200.92),
              Image.asset(
                'images/drawing.jpeg',
                width: 483,
                height:320 ,
                fit:BoxFit.contain
              ),
              const SizedBox(height: 120,),
              ElevatedButton(
                  onPressed: (){
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    minimumSize: const Size(255, 50), // Adjust the size
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                  )
              )
            ],
          ),
      ),
    );
  }
}
