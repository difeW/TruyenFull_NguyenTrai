import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_chapter_detail_event.dart';
part 'list_chapter_detail_state.dart';

class ListChapterDetailBloc extends Bloc<ListChapterDetailEvent, ListChapterDetailState> {
  ListChapterDetailBloc() : super(ListChapterDetailInitial()) {
    on<ListChapterDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
