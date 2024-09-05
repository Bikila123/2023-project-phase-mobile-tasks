import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CreateTask extends StatelessWidget{
  const CreateTask({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const SizedBox(height:25.0),
            // Row with chevron left and more vert
             Container(
               margin: const EdgeInsets.only(bottom:10.0),
               child: const Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Icon(
                     Icons.arrow_back_ios,
                     size: 40,
                     color: Color(0xFFEE6F57),
                   ),
                   Icon(
                     Icons.more_vert,
                     size: 40,
                   )
                 ],
               ),
             ),
            //Create New Task title
            const Center(
              child: Text(
                'Create New Task',
                 style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            //line break
               Center(
                child: Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black.withOpacity(0.2)
                ),
              ),
            //Main task name label with filled text field
            const Padding(
              padding: EdgeInsets.only(left:10, bottom: 10),
              child: Text(
                'Main task name',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFEE6F57),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'UI/UX App Design',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                contentPadding: const EdgeInsets.all(6),
                filled: true,
                fillColor: Colors.grey[100]
              ),
            ),
            const SizedBox(height: 5.0),
            //Due date label with filled text field and date icon
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                'Due date',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEE6F57),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'April 29, 2023 12:30 AM',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                contentPadding: const EdgeInsets.all(9),
                filled: true,
                fillColor: Colors.grey[100],
                suffixIcon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFFEE6F57),
                )
              ),
            ),
            const SizedBox(height: 5.0),
            const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 10),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEE6F57)
                ),
              )
            ),
            TextField(
              maxLines:3,
              decoration: InputDecoration(
                hintText: 'First I have to animate the logo and later prototyping my design. It\'s very important',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                contentPadding: const EdgeInsets.all(6),
                filled: true,
                fillColor: Colors.grey[100]
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 15.0),
            //Add task button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEE6F57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    minimumSize: const Size(180, 50)
                  ),
                  child: const Text(
                    'Add task',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}