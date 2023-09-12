import 'package:flutter/material.dart';
import 'dart:math';
import 'SecondPage.dart'; // Tuodaan SecondPage.dart-tiedosto

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eka Flutter app',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = Colors.white;
  Color textColor = Colors.black;

  void _changeColor() {
    setState(() {
      final random = Random();
      _backgroundColor = Color(0xFF000000 + random.nextInt(0xFFFFFF));
      textColor = Color(0xFFFFFFFF - _backgroundColor.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aloitus sivu'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SecondPage(),
            ));
          },
          child: Text('Tulo laskuri'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              padding: EdgeInsets.all(16.0),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Roope Pajarinen'),
                  Text('Software Designer', style: TextStyle(fontSize: 18.0)),
                ],
              ))),
    );
  }
}
