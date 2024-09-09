import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            appBar(),
            detailImage(),
            const SizedBox(height: 15),
            taskDetails(),
          ],
        ),
      ),
    );
  }

  Column taskDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Title',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEE6F57)),
          ),
        ),
        TextField(
          decoration: InputDecoration(
              hintText: 'UI/UX App Design',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.grey[100]),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Description',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEE6F57)),
          ),
        ),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
              hintText:
                  'First I have to animate the logo and later prototyping my design. It\'s very important',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.grey[100]),
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Deadline',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEE6F57)),
          ),
        ),
        TextField(
          decoration: InputDecoration(
              hintText: 'April. 29, 2023',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.grey[100]),
        ),
      ],
    );
  }

  Image detailImage() {
    return Image.asset(
      'images/taskdetails.jpg',
      width: 480,
      height: 320,
      fit: BoxFit.contain,
    );
  }

  Container appBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Color(0xFFEE6F57),
          ),
          Text(
            'Task Detail',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Icon(
            Icons.more_vert,
            size: 24,
          )
        ],
      ),
    );
  }
}
