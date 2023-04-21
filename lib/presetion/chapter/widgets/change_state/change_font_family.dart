import 'package:client_app/bloc/state_font_of_chapter/state_font_of_chapter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/font/font_text.dart';

class ChangeFontFamily extends StatelessWidget {
  const ChangeFontFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Font Family: ",
          style: FontText.labelLarge.copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: 16,
        ),
        _BuildItemFontFamily(
          onTap: () {
            context.read<StateFontOfChapterCubit>().changFontFamily(FontFamilyState.roboto);
          },
          fontFamily: 'Roboto',
          isSelect: context.watch<StateFontOfChapterCubit>().state.fontFamily == 'Roboto',
        ),
        const SizedBox(
          width: 16,
        ),
        _BuildItemFontFamily(
          onTap: () {
            context.read<StateFontOfChapterCubit>().changFontFamily(FontFamilyState.ysabeau);
          },
          fontFamily: 'Ysabeau',
          isSelect: context.watch<StateFontOfChapterCubit>().state.fontFamily == 'Ysabeau',
        ),
      ],
    );
  }
}

class _BuildItemFontFamily extends StatelessWidget {
  final bool? isSelect;
  final Function onTap;
  final String fontFamily;
  const _BuildItemFontFamily({
    Key? key,
    required this.onTap,
    required this.fontFamily,
    this.isSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              border: isSelect == true ? Border.all(width: 2, color: Colors.red) : null,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              fontFamily,
              style: TextStyle(fontFamily: fontFamily),
            ),
          ),
        ),
      ),
    );
  }
}
