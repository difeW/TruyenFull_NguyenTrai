import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/state_font_of_chapter/state_font_of_chapter_cubit.dart';
import '../../../../theme/font/font_text.dart';

class ChangeFontSize extends StatelessWidget {
  const ChangeFontSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "FontSize: ",
          style: FontText.labelLarge.copyWith(color: Colors.white),
        ),
        IconButton(
            onPressed: () {
              context.read<StateFontOfChapterCubit>().decreaseFontSize();
            },
            icon: Text(
              "-",
              style: FontText.titleLarge.copyWith(color: Colors.white),
            )),
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Text(
            context.watch<StateFontOfChapterCubit>().state.fontSize.toInt().toString(),
            style: FontText.labelLarge.copyWith(color: Colors.white),
          ),
        ),
        IconButton(
            onPressed: () {
              context.read<StateFontOfChapterCubit>().increaseFontSize();
            },
            icon: Text(
              "+",
              style: FontText.titleLarge.copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
