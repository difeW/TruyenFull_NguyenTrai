import 'package:client_app/data/response/chapter_response.dart';
import 'package:client_app/presetion/chapter/bloc/chapter_detail/chapter_detail_bloc.dart';
import 'package:client_app/theme/font/font_text.dart';
import 'package:client_app/widgets/loading/loadingWidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../bloc/state_font_of_chapter/state_font_of_chapter_cubit.dart';
import 'change_state/change_state.dart';

class ChapterDetail extends StatelessWidget {
  final int idChapter;
  ChapterDetail({Key? key, required this.idChapter}) : super(key: key);

  final ValueNotifier<bool> hiddenNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final stateWatch = context.watch<StateFontOfChapterCubit>().state;
    return BlocProvider(
      create: (context) =>
          ChapterDetailBloc(ChapterResponse(DioInfo.dio()))..add(GetChapter(idChapter)),
      child: BlocBuilder<ChapterDetailBloc, ChapterDetailState>(
        builder: (context, state) {
          late Widget content;
          switch (state.runtimeType) {
            case ChapterDetailLoading:
              content = LoadingWidget(background: stateWatch.background,);
              break;
            case ChapterDetailHasData:
              final data = (state as ChapterDetailHasData).chapterModel;
              content = Container(
                color: stateWatch.background,
                child: SafeArea(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          hiddenNotifier.value = !hiddenNotifier.value;
                        },
                        child: Column(
                          children: [
                            _buildHeader(data.header ?? "", stateWatch),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      _buildTitle(data.header ?? "", stateWatch),
                                      _buildContent(data.body!.join("\n"), stateWatch)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                        animation: hiddenNotifier,
                        builder: (_, __) => ChangeState(hidden: hiddenNotifier.value),
                      )
                    ],
                  ),
                ),
              );
              break;
            default:
              content = Container();
          }
          return content;
        },
      ),
    );
  }

  Widget _buildHeader(String tittle, StateFontOfChapter stateWatch) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              tittle,
              style: TextStyle(
                fontSize: 14,
                color: stateWatch.textColors,
                fontFamily: stateWatch.fontFamily
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle(String tittle, StateFontOfChapter stateWatch) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        tittle,
        style: FontText.titleLarge.green.copyWith(fontFamily: stateWatch.fontFamily),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildContent(String content, StateFontOfChapter stateWatch) {
    return Html(data: content, style: {
      "body": Style(
          fontSize: FontSize(stateWatch.fontSize),
          fontFamily: stateWatch.fontFamily,
          color: stateWatch.textColors),
    });
  }
}


