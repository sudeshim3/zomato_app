import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:zomato_app/models/Category.dart';

@immutable
abstract class CategoryState extends Equatable {
  CategoryState([List props = const []]) : super(props);
}

class UnInitializedCategoryState extends CategoryState {}

class CategoryFetchingState extends CategoryState {
}

class CategoryFetchedState extends CategoryState {
  final List<Categories> categories;

  CategoryFetchedState({@required this.categories}): assert(categories != null);
}

class CategoryErrorState extends CategoryState{}

class CategoryEmptyState extends CategoryState{}