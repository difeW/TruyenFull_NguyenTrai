import 'package:client_app/bloc/state_font_of_chapter/state_font_of_chapter_cubit.dart';
import 'package:client_app/theme/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemBackground extends StatelessWidget {
  final bool? isSelect;
  final Color background;
  final Color textColor;
  final BackgroundType backgroundType;
  const ItemBackground(
      {Key? key,
      required this.background,
      required this.textColor,
      required this.backgroundType,
      this.isSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.read<StateFontOfChapterCubit>().changeBackground(backgroundType);
          },
          child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: isSelect == true ? Border.all(color: Colors.red, width: 2) : null,
              color: background,
            ),
            child: Text(
              "A",
              style: TextStyle(color: textColor),
            ),
          ),
        ),
        const SizedBox(
          width: AppSize.SIZE_NORMAL,
        ),
      ],
    );
  }
}
