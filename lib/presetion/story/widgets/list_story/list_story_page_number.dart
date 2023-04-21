import 'package:flutter/material.dart';

import '../../../../theme/font/font_text.dart';

class ListStoryPageNumber extends StatefulWidget {
  final int? numPage;
  final bool? hidden;
  const ListStoryPageNumber({Key? key, this.numPage, this.hidden}) : super(key: key);

  @override
  State<ListStoryPageNumber> createState() => _ListStoryPageNumberState();
}

class _ListStoryPageNumberState extends State<ListStoryPageNumber> {
  late int numPage;
  late bool hidden;

  @override
  void initState() {
    numPage = widget.numPage ?? 0;
    hidden = numPage == 0 ? true : false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ListStoryPageNumber oldWidget) {
    if(oldWidget.hidden != widget.hidden){
      setState(() {
        hidden = !hidden;
      });
    }

    if(oldWidget.numPage != widget.numPage){
      setState(() {
        numPage = widget.numPage??0;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hidden? 0: 60,
      height: hidden? 0: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: AppColor.primary,
      ),
      child: Center(
          child: Text(
        numPage.toString(),
        style: FontText.labelLarge.copyWith(color: Colors.white),
      )),
    );
  }
}
