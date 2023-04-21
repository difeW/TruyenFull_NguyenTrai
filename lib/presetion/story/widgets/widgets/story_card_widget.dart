import 'package:client_app/theme/font/font_text.dart';
import 'package:flutter/material.dart';

class StoryCardWidget extends StatelessWidget {
  final Widget child;
  final bool? noPadding;
  const StoryCardWidget({Key? key, required this.child, this.noPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(noPadding == true ? 0 : 16),
      decoration: BoxDecoration(
        color: AppColor.silver.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: child,
    );
  }
}
