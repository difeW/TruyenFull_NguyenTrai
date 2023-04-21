import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../models/chapter_model.dart';

part 'chapter_response.g.dart';

@RestApi(
  baseUrl: "https://truyen-clone.getdata.one",
)
abstract class ChapterResponse {
  factory ChapterResponse(Dio dio, {String baseUrl}) = _ChapterResponse;

  @GET('/story/{slug}/chapters')
  Future<List<ChapterModel>> getChapters(
      @Path('slug') String slug,
      );

  @GET('/chapter/id/{id}')
  Future<ChapterModel> getDetailChapter(
      @Path('id') int id,
      );
}
