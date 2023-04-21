import 'package:client_app/core/routes.dart';
import 'package:client_app/theme/font/font_text.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/chapter_model.dart';

class TableOfContent extends StatefulWidget {
  final bool hidden;
  final List<ChapterModel> listChapterModel;
  const TableOfContent({Key? key, required this.hidden, required this.listChapterModel})
      : super(key: key);

  @override
  State<TableOfContent> createState() => _TableOfContentState();
}

class _TableOfContentState extends State<TableOfContent> {
  late bool hidden;

  @override
  void initState() {
    hidden = widget.hidden;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TableOfContent oldWidget) {
    if (oldWidget.hidden != widget.hidden) {
      setState(() {
        hidden = widget.hidden;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final double heightWidget = MediaQuery.of(context).size.width * 70 / 100;
    return AnimatedPositioned(
      top: 0,
      left: hidden ? 0 : -heightWidget,
      duration: const Duration(milliseconds: 500),
      child: Container(
        width: heightWidget,
        height: MediaQuery.of(context).size.height,
        color: AppColor.black.withOpacity(0.7),
        child: Column(
          children: [
            Text(
              "Mục lục",
              style: FontText.titleLarge.white,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widget.listChapterModel
                        .map((e) => SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColor.silver),
                                  onPressed: () async {
                                    await Navigator.of(context)
                                        .pushNamed(RouteManager.chapterListDetail, arguments: {
                                      "currentID": e.id,
                                      "listID": widget.listChapterModel,
                                    }).then((value) {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    e.header ?? "",
                                    style: FontText.bodyMedium.black,
                                  )),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
