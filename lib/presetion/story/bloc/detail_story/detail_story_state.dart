part of 'detail_story_bloc.dart';

@immutable
abstract class DetailStoryState {}

class DetailStoryInitial extends DetailStoryState {}

class DetailStoryLoading extends DetailStoryState {}

class DetailStoryHasData extends DetailStoryState {
  final StoryDetailModel storyDetailModel;
  final List<ChapterModel> chapters;
  DetailStoryHasData(this.storyDetailModel, this.chapters);
}
