import 'package:client_app/presetion/story/bloc/detail_story/detail_story_bloc.dart';
import 'package:client_app/presetion/story/widgets/widgets/story_card_widget.dart';
import 'package:client_app/theme/font/font_text.dart';
import 'package:client_app/theme/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/chapter_model.dart';

class DetailStoryListChapter extends StatelessWidget {
  final List<ChapterModel> listChapter;
  const DetailStoryListChapter({Key? key, required this.listChapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildLayout(listChapter: listChapter, context: context);
  }
}

Widget _buildLayout({required List<ChapterModel> listChapter, required BuildContext context}) {
  final listNew = listChapter.sublist(0, listChapter.length < 6 ? listChapter.length : 6);
  final listIdChapter =  listChapter.map((e) => e.id ?? 0).toList();
  return StoryCardWidget(
      noPadding: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.SIZE_SMALL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.SIZE_SMALL),
                  child: Text(
                    "Các chương mới nhất",
                    style: FontText.headerCard,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      context
                          .read<DetailStoryBloc>()
                          .add(OnClickSeeAllChapter(Navigator.of(context), listChapter));
                    },
                    child: const Text("Xem tất cả")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.SIZE_NORMAL),
              child: Column(
                children: listNew
                    .map((e) => ItemChapter(
                          chapterModel: e,
                          listIdChapter: listIdChapter,
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ));
}

class ItemChapter extends StatelessWidget {
  final ChapterModel chapterModel;
  final List<int> listIdChapter;
  const ItemChapter({Key? key, required this.chapterModel, required this.listIdChapter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context
            .read<DetailStoryBloc>()
            .add(OnPressAChapter(Navigator.of(context), listIdChapter, chapterModel.id ?? 0));
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          chapterModel.header ?? "",
          style: FontText.bodyMedium.normal,
        ),
      ),
    );
  }
}
