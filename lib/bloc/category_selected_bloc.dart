import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zomato_app/ZomatoRepository.dart';
import 'package:zomato_app/models/Category.dart';
import './bloc.dart';

class CategorySelectedBloc
    extends Bloc<CategorySelectedEvent, CategorySelectedState> {
  final ZomatoRepository zomatoRepository;

  CategorySelectedBloc({this.zomatoRepository})
      : assert(zomatoRepository != null);

  @override
  CategorySelectedState get initialState => UnInitializedCategoryState();

  @override
  Stream<CategorySelectedState> mapEventToState(
      CategorySelectedEvent event) async* {
    if (event is CategorySelected) {
      yield CategoryFetchingState();
      try {
        final List<Categories> category =
        await zomatoRepository.fetchZomatoCategories();
        if (category.length == 0)
          yield CategoryEmptyState();
        else
          yield CategoryFetchedState(categories: category);
      }catch(_) {
        yield CategoryErrorState();
      }

    }
  }
}
