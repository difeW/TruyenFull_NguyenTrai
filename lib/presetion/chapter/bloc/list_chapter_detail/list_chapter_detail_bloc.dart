import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/chapter_model.dart';

part 'list_chapter_detail_event.dart';
part 'list_chapter_detail_state.dart';

class ListChapterDetailBloc extends Bloc<ListChapterDetailEvent, ListChapterDetailState> {
  final List<ChapterModel> listChapter;
  ListChapterDetailBloc(this.listChapter) : super(ListChapterDetailInitial(listChapter)) {
    on<ListChapterDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
