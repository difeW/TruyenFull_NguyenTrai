part of 'list_story_bloc.dart';

@immutable
abstract class ListStoryEvent {}

class GetStoriesFirstPage extends ListStoryEvent {}

class OnLoadMoreStories extends ListStoryEvent{}

class OnPressItemStory extends ListStoryEvent{
  final StoryModel storyModel;
  final NavigatorState navigateState;
  OnPressItemStory(this.storyModel, this.navigateState);
}

