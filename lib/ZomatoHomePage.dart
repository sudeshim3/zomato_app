import 'package:flutter/material.dart';
import 'package:zomato_app/HorizontalBar.dart';
import 'package:zomato_app/Theme/Themes.dart';
import 'package:zomato_app/ZomatoRepository.dart';
import 'package:zomato_app/bloc/category_selected_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZomatoPage extends StatefulWidget {

  final ZomatoRepository zomatoRepository;

  ZomatoPage({this.zomatoRepository});

  @override
  _ZomatoPageState createState() => _ZomatoPageState();
}

class _ZomatoPageState extends State<ZomatoPage> {

  CategorySelectedBloc _categorySelectedBloc;
  @override
  void initState() {
    super.initState();
    _categorySelectedBloc = CategorySelectedBloc(zomatoRepository: widget.zomatoRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zomato clone', style: appBarTextStye,),),
      body: BlocProvider(
        builder: (context) => _categorySelectedBloc,
        child: Container(
          child: Column(
            children: <Widget>[
              HorizontalBar()
            ],
          ),
        ),
      ),

    );
  }
}
