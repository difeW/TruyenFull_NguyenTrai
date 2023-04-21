part of 'list_chapter_detail_bloc.dart';

@immutable
abstract class ListChapterDetailState {}

class ListChapterDetailInitial extends ListChapterDetailState {
  final List<ChapterModel> listData;

  ListChapterDetailInitial(this.listData);
}
