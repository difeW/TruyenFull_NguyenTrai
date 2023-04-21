import 'package:bloc/bloc.dart';
import 'package:client_app/core/routes.dart';
import 'package:client_app/data/models/chapter_model.dart';
import 'package:client_app/data/models/story_detail_model.dart';
import 'package:client_app/data/response/chapter_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../data/response/story_response.dart';

part 'detail_story_event.dart';
part 'detail_story_state.dart';

class DetailStoryBloc extends Bloc<DetailStoryEvent, DetailStoryState> {
  final int idStory;
  final StoryResponse _storyResponse;
  final ChapterResponse _chapterResponse;

  DetailStoryBloc(this.idStory, this._storyResponse, this._chapterResponse)
      : super(DetailStoryLoading()) {
    on<GetDetailStory>((event, emit) async {
      emit(DetailStoryLoading());
      late List<ChapterModel> listChapter;
      late StoryDetailModel story;
      await _storyResponse.getDetailStory(idStory).then((value) async {
        story = value;
        listChapter = await _chapterResponse.getChapters(story.slug ?? "");
      });
      emit(DetailStoryHasData(story, listChapter));
    });

    on<OnPressAChapter>((event, emit) {
      event.navigatorState.pushNamed(RouteManager.chapterListDetail, arguments: {
        "currentID": event.currentId,
        "listID": event.listChapter,
      });
    });

    on<OnClickSeeAllChapter>((event, emit) {
      event.navigatorState.pushNamed(RouteManager.chapterListAll, arguments: event.listChapter);
    });

    on<OnPressButtonReadStory>((event, emit) {
      Map<String, dynamic> data = {"listID": event.listChapter};
      event.navigatorState.pushNamed(RouteManager.chapterListDetail, arguments: data);
    });
  }
}
