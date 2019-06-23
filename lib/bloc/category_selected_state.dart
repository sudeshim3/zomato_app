import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:zomato_app/models/Category.dart';

@immutable
abstract class CategorySelectedState extends Equatable {
  CategorySelectedState([List props = const []]) : super(props);
}

class UnInitializedCategoryState extends CategorySelectedState {}

class CategoryFetchingState extends CategorySelectedState {
}

class CategoryFetchedState extends CategorySelectedState {
  final List<Categories> categories;

  CategoryFetchedState({@required this.categories}): assert(categories != null);
}

class CategoryErrorState extends CategorySelectedState{}

class CategoryEmptyState extends CategorySelectedState{}