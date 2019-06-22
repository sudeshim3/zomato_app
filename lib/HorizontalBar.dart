import 'package:flutter/material.dart';

class HorizontalBar extends StatefulWidget {
  @override
  _HorizontalBarState createState() => _HorizontalBarState();
}

class _HorizontalBarState extends State<HorizontalBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemBuilder: buildItem,
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

// If aligmnet is not added then flutter won't set it's height to specified value( here 50), instead will pick the parents height.
// button is designed ref to answer https://stackoverflow.com/a/51464163/7735032

Widget buildItem(context, index) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      height: 50,
      width: 150,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Material(  // <----------------------------- Outer Material
        shadowColor: Colors.grey[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        elevation: 6.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            gradient: LinearGradient(
              begin: AlignmentDirectional.bottomStart,
              end: AlignmentDirectional.topEnd,
              colors: [
                Colors.blue,
                Colors.lightBlue[300],
              ],
            ),
          ),
          child: Material(  // <------------------------- Inner Material
            type: MaterialType.transparency,
            elevation: 6.0,
            color: Colors.transparent,
            shadowColor: Colors.grey[50],
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),//<------------------------- InkWell
              splashColor: Colors.white30,
              onTap: () {},
              child: Center(
                child: Container(
                  child: Text(
                    "hello World",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
