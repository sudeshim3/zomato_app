import 'package:flutter/material.dart';
import 'package:zomato_app/ZomatoHomePage.dart';
import 'package:zomato_app/ZomatoRepository.dart';
import 'package:zomato_app/HorizontalBar.dart';

import 'Theme/Themes.dart';

void main() {

  ZomatoRepository zomatoRepository = ZomatoRepository();
  runApp(MyApp(zomatoRepository: zomatoRepository,));
}

class MyApp extends StatelessWidget {

   final ZomatoRepository zomatoRepository;

  MyApp({this.zomatoRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZomatoPage(zomatoRepository: zomatoRepository,),
      debugShowCheckedModeBanner: false,
    );
  }
}


