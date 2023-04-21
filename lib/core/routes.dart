import 'package:client_app/data/models/category_model.dart';
import 'package:client_app/data/models/chapter_model.dart';
import 'package:client_app/data/models/story_model.dart';
import 'package:client_app/data/response/category_response.dart';
import 'package:client_app/data/response/chapter_response.dart';
import 'package:client_app/presetion/category/screens/category_screen.dart';
import 'package:client_app/presetion/chapter/screens/chapter_list_all.dart';
import 'package:client_app/presetion/chapter/screens/chapter_list_detail.dart';
import 'package:client_app/presetion/story/bloc/detail_story/detail_story_bloc.dart';
import 'package:client_app/presetion/story/screens/detail_story_screen.dart';
import 'package:client_app/presetion/story/screens/list_story_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../data/response/story_response.dart';
import '../presetion/category/bloc/list_category/list_category_bloc.dart';
import '../presetion/story/bloc/list_story/list_story_bloc.dart';
import 'dio_config/dio_info.dart';

class RouteManager {
  static final dio = DioInfo.dio();

  static const String categoryScreen = "/categoryScreen";
  static const String listStoryScreen = "/listStoryScreen";
  static const String detailStoryScreen = "/detailStoryScreen";
  static const String chapterListAll = "/chapterListAll";
  static const String chapterListDetail = "/chapterListDetail";

  static Widget screenToShow(RouteSettings setting) {
    switch (setting.name) {
      case categoryScreen:
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => ListCategoryBloc(CategoryResponse(dio))..add(GetCategories()),
            ),
          ],
          child: const CategoryScreen(),
        );
      case listStoryScreen:
        final category = setting.arguments;
        return MultiBlocProvider(providers: [
          BlocProvider(
            create: (_) => ListStoryBloc(StoryResponse(dio), (category as CategoryModel).id ?? 0)
              ..add(GetStoriesFirstPage()),
          ),
        ], child: ListStoryScreen(category: (category as CategoryModel)));
      case detailStoryScreen:
        final story = setting.arguments;
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => DetailStoryBloc(
                    (story as StoryModel).id ?? 0, StoryResponse(dio), ChapterResponse(dio))
                  ..add(GetDetailStory()),
              ),
            ],
            child: DetailStoryScreen(
              storyModel: (story as StoryModel),
            ));
      case chapterListAll:
        final listChapter = setting.arguments;
        return ChapterListAll(
          listChapter: (listChapter as List<ChapterModel>),
        );
      case chapterListDetail:
        try{
          Map<String, dynamic> mapData = setting.arguments as Map<String, dynamic>;
          int? currentID = mapData['currentID'];
          List<ChapterModel> listID = mapData['listID'];
          return ChapterListDetail(listChapter: listID, currentIdChapter: currentID);
        } catch(e){
          return const ChapterListDetail(listChapter: [], currentIdChapter: null);
        }
      default:
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error append"),
          ),
          body: const Center(
            child: Text("Route no exits"),
          ),
        );
    }
  }

  static Route<dynamic> generateRoute(RouteSettings setting) {
    return MaterialPageRoute(settings: setting, builder: (context) => screenToShow(setting));
  }
}
