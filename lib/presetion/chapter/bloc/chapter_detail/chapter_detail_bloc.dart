
import 'package:bloc/bloc.dart';
import 'package:client_app/data/models/chapter_model.dart';
import 'package:meta/meta.dart';

import '../../../../data/response/chapter_response.dart';

part 'chapter_detail_event.dart';
part 'chapter_detail_state.dart';

class ChapterDetailBloc extends Bloc<ChapterDetailEvent, ChapterDetailState> {

  final ChapterResponse _chapterResponse;

  ChapterDetailBloc(this._chapterResponse) : super(ChapterDetailLoading()) {
    on<ChapterDetailEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetChapter>((event, emit) async {
      final dataChapter = await _chapterResponse.getDetailChapter(event.idChapter);
      emit(ChapterDetailHasData(dataChapter));
    });

  }
}
