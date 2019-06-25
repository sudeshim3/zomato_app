import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_app/LoadingProgress.dart';
import 'package:zomato_app/bloc/category_state.dart';

import 'bloc/category_selected_bloc.dart';
import 'bloc/category_selected_event.dart';
import 'models/Category.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HorizontalBar extends StatefulWidget {
  @override
  _HorizontalBarState createState() => _HorizontalBarState();
}

class _HorizontalBarState extends State<HorizontalBar> {
  @override
  Widget build(BuildContext context) {
    var categorySelectedBloc = BlocProvider.of<CategorySelectedBloc>(context);
    return BlocListener(
      child: BlocBuilder(
        bloc: categorySelectedBloc,
        builder: (context, state) {
          if(state is CategoryFetchingState) {;
          categorySelectedBloc.dispatch(
              CategorySelected(category: Category(id: 1, name: "Dosa")));
            return IndefiniteProgress();
          }
          else
            if(state is CategoryFetchedState) {
              final fetchedState = state;
              return CategoryList(fetchedState.categories);
            }
            else
              return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget CategoryList(List<Categories> categories) {
    return Container(
        height: 100,
        child: ListView.builder(
          itemBuilder: (context, index) => buildItem(context, categories[index]),
          shrinkWrap: true,
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
        ));
  }
}

// If aligmnet is not added then flutter won't set it's height to specified value( here 50), instead will pick the parents height.
// button is designed ref to answer https://stackoverflow.com/a/51464163/7735032

Widget buildItem(context, Categories categories) {
  final wids = BlocProvider.of<CategorySelectedBloc>(context);
  return Align(
    alignment: Alignment.center,
    child: Container(
      height: 50,
      width: 150,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Material(
        // <----------------------------- Outer Material
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
          child: Material(
            // <------------------------- Inner Material
            type: MaterialType.transparency,
            elevation: 6.0,
            color: Colors.transparent,
            shadowColor: Colors.grey[50],
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              //<------------------------- InkWell
              splashColor: Colors.white30,
              onTap: () {

                wids.dispatch(
                    CategorySelected(category: Category(id: 1, name: "Dosa")));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                /*child: AutoSizeText(
              "This string will be automatically resized to fit in two lines.",
              style: TextStyle(fontSize: 30.0),
              maxLines: 2,
            )*/
                child: Center(
                  child: Container(
                    child: AutoSizeText(
                      categories.category.name,
                      maxLines: 2,
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
    ),
  );
}
