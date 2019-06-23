 import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:zomato_app/models/Category.dart';

@immutable
abstract class CategorySelectedEvent extends Equatable {
  CategorySelectedEvent([List props = const []]) : super(props);
}

class CategorySelected extends CategorySelectedEvent{
  final Category category;

  CategorySelected({this.category}): assert(category != null);
}
