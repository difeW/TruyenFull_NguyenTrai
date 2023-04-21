import 'package:client_app/theme/font/font_text.dart';
import 'package:flutter/material.dart';

import '../widgets/chapter_detail.dart';

class ChapterListDetail extends StatelessWidget {
  final List<int> listIdChapter;
  final int? currentIdChapter;
  const ChapterListDetail({Key? key, required this.listIdChapter, this.currentIdChapter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    listIdChapter.sort();
    final PageController controller = PageController(
        initialPage: currentIdChapter != null ? listIdChapter.indexOf(currentIdChapter ?? 0) : 0);
    return Scaffold(
      body: listIdChapter.isNotEmpty? PageView.builder(
          controller: controller,
          itemCount: listIdChapter.length,
          itemBuilder: (context, index) {
            return ChapterDetail(idChapter: listIdChapter[index]);
          }): Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
        child: Text("Hiện tại truyện chưa được cập nhật bất kì chương nào.", style: FontText.labelLarge, textAlign: TextAlign.center,),
      ),
          ),
    );
  }
}
