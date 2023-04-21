import 'package:client_app/theme/font/font_text.dart';
import 'package:flutter/material.dart';


class AppBarChapter extends StatefulWidget {
  final bool hidden;
  final Function? callBack;
  const AppBarChapter({Key? key, required this.hidden, required this.callBack}) : super(key: key);

  @override
  State<AppBarChapter> createState() => _AppBarChapterState();
}

class _AppBarChapterState extends State<AppBarChapter> {
  late bool hidden;

  @override
  void initState() {
    hidden = widget.hidden;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppBarChapter oldWidget) {
    if (oldWidget.hidden != widget.hidden) {
      setState(() {
        hidden = widget.hidden;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  final double heightWidget = 50;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: hidden ? 0 : -heightWidget,
      left: 0,
      duration: const Duration(milliseconds: 200),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: heightWidget,
        color: AppColor.black.withOpacity(0.7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                widget.callBack!.call();
              },
              icon: Icon(
                Icons.menu,
                color: AppColor.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: AppColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
