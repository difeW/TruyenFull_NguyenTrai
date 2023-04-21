
import 'package:bloc/bloc.dart';
import 'package:client_app/core/routes.dart';
import 'package:client_app/data/response/story_response.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/story_model.dart';

part 'list_story_event.dart';
part 'list_story_state.dart';

class ListStoryBloc extends Bloc<ListStoryEvent, ListStoryState> {
  final StoryResponse _storyResponse;
  final int _idCategory;
  final int numberItem = 20;
  ListStoryBloc(this._storyResponse, this._idCategory) : super(const ListStoryLoading()) {
    on<GetStoriesFirstPage>((event, emit) async {
      emit(const ListStoryLoading());
      try{
        final stories = await _storyResponse.getStories(_idCategory, 0, numberItem);
        if (stories.length < numberItem) {
          emit(ListStoryHasData(stories: [...stories], loadMore: false, page: 1));
        } else {
          emit(ListStoryHasData(stories: [...stories, StoryModel()], loadMore: true, page: 1));
        }
      }catch(e){
        emit(ListStoryError());
      }
    });

    on<OnLoadMoreStories>((event, emit) async {
      if (state.loadMore == true && state.loadingMore != true) {
        emit(ListStoryHasData(
            stories: state.stories, loadMore: state.loadMore, loadingMore: true, page: state.page));
        final stories = await _storyResponse.getStories(_idCategory, (state.page ?? 0), numberItem);
        final nowStateListData = state.stories;
        nowStateListData!.removeLast();
        if (stories.length < numberItem) {
          emit(ListStoryHasData(
              stories: [...nowStateListData, ...stories],
              loadMore: false,
              loadingMore: false,
              page: (state.page ?? 0) + 1));
        } else {
          emit(ListStoryHasData(
              stories: [...nowStateListData, ...stories, StoryModel()],
              loadMore: true,
              loadingMore: false,
              page: (state.page ?? 0) + 1));
        }
      }
    });

    on<OnPressItemStory>((event, emit) {
      event.navigateState.pushNamed(RouteManager.detailStoryScreen, arguments: event.storyModel);
    });
  }
}
