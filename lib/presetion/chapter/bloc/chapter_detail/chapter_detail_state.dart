part of 'chapter_detail_bloc.dart';

@immutable
abstract class ChapterDetailState {}

class ChapterDetailInitial extends ChapterDetailState {}

class ChapterDetailLoading extends ChapterDetailState{}

class ChapterDetailHasData extends ChapterDetailState{
  final ChapterModel chapterModel;

  ChapterDetailHasData(this.chapterModel);
}
