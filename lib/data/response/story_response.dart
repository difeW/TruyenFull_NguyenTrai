import 'package:client_app/data/models/story_detail_model.dart';
import 'package:client_app/data/models/story_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'story_response.g.dart';

@RestApi(
  baseUrl: "https://truyen-clone.getdata.one",
)
abstract class StoryResponse {
  factory StoryResponse(Dio dio, {String baseUrl}) = _StoryResponse;

  @GET('/category/id/{id}/story')
  Future<List<StoryModel>> getStories(
    @Path('id') int id,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('/story/id/{id}')
  Future<StoryDetailModel> getDetailStory(
    @Path('id') int id,
  );
}
