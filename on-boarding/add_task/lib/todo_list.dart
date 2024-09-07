import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Task.dart';

class TodoList extends StatelessWidget{
   TodoList({Key? key}) : super(key: key);
  List<Task> tasks = [
    Task(
      iconText: 'U',
      taskDescription: 'UI/UX App Design',
      dateText: 'April, 29, 2023',
      taskColor: Colors.red,
    ),
    Task(
      iconText: 'U',
      taskDescription: 'UI/UX App Design',
      dateText: 'April, 29, 2023',
      taskColor: Colors.green,
    ),
    Task(
      iconText: 'V',
      taskDescription: 'View candidates',
      dateText: 'April, 29, 2023',
      taskColor: Colors.yellow,
    ),
    Task(
      iconText: 'F',
      taskDescription: 'Football CU Dry-bling',
      dateText: 'April, 29, 2023',
      taskColor: Colors.red,
    ),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(bottom: 1),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                    color: Color(0xFFEE6F57),
                  ),
                  Text(
                    'Todo List',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 40,
                  )
                ],
              ),
            ),
            Image.asset(
              'images/thingstodo.jpg',
              width: 480,
              height: 320,
              fit: BoxFit.contain,
            ),
            const Text(
              'Tasks list',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}