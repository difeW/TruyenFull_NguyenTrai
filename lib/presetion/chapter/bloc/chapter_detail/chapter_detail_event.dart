part of 'chapter_detail_bloc.dart';

@immutable
abstract class ChapterDetailEvent {}

class GetChapter extends ChapterDetailEvent {
  final int idChapter;

  GetChapter(this.idChapter);
}