part of 'list_story_bloc.dart';

@immutable
abstract class ListStoryState {
  final List<StoryModel>? stories;
  final bool? loadMore;
  final int? page;
  final bool? loadingMore;
  const ListStoryState( {this.stories, this.loadMore, this.page, this.loadingMore});
}

class ListStoryLoading extends ListStoryState {
  const ListStoryLoading({super.loadMore});
}

class ListStoryHasData extends ListStoryState {
  const ListStoryHasData({super.stories, super.loadMore, super.page, super.loadingMore});
}

