import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../models/category_model.dart';
part 'category_response.g.dart';

@RestApi(
  baseUrl: "https://truyen-clone.getdata.one",
)
abstract class CategoryResponse {
  factory CategoryResponse(Dio dio, {String baseUrl}) = _CategoryResponse;

  @GET("/category")
  Future<List<CategoryModel>> getCategories();
}