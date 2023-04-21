part of 'state_font_of_chapter_cubit.dart';


class StateFontOfChapter {
  final double fontSize;
  final Color background;
  final Color textColors;
  final String fontFamily;

  StateFontOfChapter({required this.fontSize,required this.background,required this.textColors,required this.fontFamily,});

  StateFontOfChapter copyWith({double? fontSize, Color? background, Color? textColors, String? fontFamily}){
    return StateFontOfChapter(
      fontSize: fontSize ?? this.fontSize,
      background: background ?? this.background,
      textColors: textColors ?? this.textColors,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
