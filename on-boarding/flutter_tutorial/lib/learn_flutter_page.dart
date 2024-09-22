import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Learn Flutter',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                              Image.network("https://tse1.mm.bing.net/th?id=OIP.ImrwbkhLXqM4sPogG-kziAHaEL&pid=Api&P=0&h=220"),
                                                          Image.network("https://tse1.mm.bing.net/th?id=OIP.ImrwbkhLXqM4sPogG-kziAHaEL&pid=Api&P=0&h=220"),
        
              Switch(
                  value: isSwitch,
                  onChanged: (bool newBool) {
                    setState(() {
                      isSwitch = newBool;
                    });
                  }),
              Checkbox(
                  value: isChecked,
                  onChanged: (bool? newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  }),
                  Image.network("https://tse1.mm.bing.net/th?id=OIP.ImrwbkhLXqM4sPogG-kziAHaEL&pid=Api&P=0&h=220")
            ],
          ),
        ),
      ),
    );
  }
}
