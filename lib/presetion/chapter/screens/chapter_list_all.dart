
import 'package:client_app/core/routes.dart';

import 'package:client_app/theme/font/font_text.dart';
import 'package:flutter/material.dart';

import '../../../data/models/chapter_model.dart';

class ChapterListAll extends StatefulWidget {
  final List<ChapterModel> listChapter;
  const ChapterListAll({Key? key, required this.listChapter}) : super(key: key);

  @override
  State<ChapterListAll> createState() => _ChapterListAllState();
}

class _ChapterListAllState extends State<ChapterListAll> {
  late final ValueNotifier<List<ChapterModel>> listChapterNotifier;
  late List<int> listId;

  @override
  void initState() {
    listChapterNotifier = ValueNotifier(widget.listChapter);
    listId = widget.listChapter.map((e) => e.id ?? 0).toList();
    listId.sort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 3,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.outline,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                listChapterNotifier.value = listChapterNotifier.value.reversed.toList();
              },
              icon: Icon(
                Icons.menu,
                color: AppColor.primary,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedBuilder(
            animation: listChapterNotifier,
            builder: (_, __) => Column(
              children: [
                ...listChapterNotifier.value
                    .map((e) => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0, backgroundColor: AppColor.silver.withOpacity(0.55)),
                              onPressed: () {
                                Navigator.pushNamed(context, RouteManager.chapterListDetail,
                                    arguments: {
                                      'currentID': e.id,
                                      'listID': widget.listChapter,
                                    });
                              },
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    e.header ?? "",
                                    style: FontText.bodyMedium.normal,
                                  ))),
                        )))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
