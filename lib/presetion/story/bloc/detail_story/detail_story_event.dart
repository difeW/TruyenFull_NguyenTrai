part of 'detail_story_bloc.dart';

@immutable
abstract class DetailStoryEvent {}

class GetDetailStory extends DetailStoryEvent{}

class OnClickSeeAllChapter extends DetailStoryEvent{
  final NavigatorState navigatorState;
  final List<ChapterModel> listChapter;

  OnClickSeeAllChapter(this.navigatorState, this.listChapter);
}

class OnPressAChapter extends DetailStoryEvent{
  final NavigatorState navigatorState;
  final List<int> listIdChapter;
  final int currentId;

  OnPressAChapter(this.navigatorState, this.listIdChapter, this.currentId,);

}

class OnPressButtonReadStory extends DetailStoryEvent{
  final NavigatorState navigatorState;
  final List<int> listIdChapter;

  OnPressButtonReadStory(this.navigatorState, this.listIdChapter);
}

