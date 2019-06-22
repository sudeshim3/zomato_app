import 'package:zomato_app/zomato_api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:zomato_app/models/Category.dart';


class ZomatoRepository {
  ZomatoApiProvider zomatoApiProvider = ZomatoApiProvider();

  Future <List<Categories>> fetchZomatoCategories() => zomatoApiProvider.fetchCategories("");


}