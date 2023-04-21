import 'package:client_app/theme/font/font_text.dart';
import 'package:flutter/material.dart';

import '../../../data/models/chapter_model.dart';
import '../widgets/chapter_detail.dart';

class ChapterListDetail extends StatelessWidget {
  final List<ChapterModel> listChapter;
  final int? currentIdChapter;
  const ChapterListDetail({Key? key, required this.listChapter, this.currentIdChapter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> listIdChapter = listChapter.map((e) => e.id ?? 0).toList();
    listIdChapter.sort();
    final PageController controller = PageController(
        initialPage: currentIdChapter != null ? listIdChapter.indexOf(currentIdChapter ?? 0) : 0);
    return Scaffold(
      body: listIdChapter.isNotEmpty
          ? PageView.builder(
              controller: controller,
              itemCount: listIdChapter.length,
              itemBuilder: (context, index) {
                return ChapterDetail(
                  idChapter: listIdChapter[index],
                  listChapterModel: listChapter,
                );
              })
          : Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Text(
                  "Hiện tại truyện chưa được cập nhật bất kì chương nào.",
                  style: FontText.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
