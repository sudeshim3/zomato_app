import 'package:flutter/material.dart';
import 'package:zomato_app/ZomatoRepository.dart';
import 'package:zomato_app/HorizontalBar.dart';

void main() {

//  ZomatoRepository zomatoRepository = ZomatoRepository();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

//   final ZomatoRepository zomatoRepository;

//  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZomatoPage(),
    );
  }
}

class ZomatoPage extends StatefulWidget {
  @override
  _ZomatoPageState createState() => _ZomatoPageState();
}

class _ZomatoPageState extends State<ZomatoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zomato clone'),),
      body: Container(
          child: Column(
            children: <Widget>[
          HorizontalBar()
            ],
          ),
        ),

    );
  }
}


