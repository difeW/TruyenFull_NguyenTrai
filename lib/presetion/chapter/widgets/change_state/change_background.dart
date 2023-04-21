import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/state_font_of_chapter/state_font_of_chapter_cubit.dart';
import '../../../../theme/font/font_text.dart';
import 'item_background.dart';

class ChangeBackground extends StatelessWidget {
  const ChangeBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Background: ",
          style: FontText.labelLarge.copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: 16,
        ),
        ItemBackground(
            isSelect: context.watch<StateFontOfChapterCubit>().state.background == Colors.white,
            background: Colors.white,
            textColor: Colors.black,
            backgroundType: BackgroundType.white),
        ItemBackground(
            isSelect: context.watch<StateFontOfChapterCubit>().state.background == Colors.black,
            background: Colors.black,
            textColor: Colors.white,
            backgroundType: BackgroundType.black),
        ItemBackground(
            isSelect:
                context.watch<StateFontOfChapterCubit>().state.background == Color(0xFF51643B),
            background: Color(0xFF51643B),
            textColor: Color(0xFFBAD3AC),
            backgroundType: BackgroundType.green)
      ],
    );
  }
}
