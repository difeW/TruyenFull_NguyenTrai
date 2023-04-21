import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'state_font_of_chapter_state.dart';

enum BackgroundType { black, white, green }
enum FontFamilyState { roboto, ysabeau}

class StateFontOfChapterCubit extends Cubit<StateFontOfChapter> {
  StateFontOfChapterCubit()
      : super(StateFontOfChapter(fontSize: 20, background: Colors.white, textColors: Colors.black, fontFamily: 'Roboto'));

  void changeFontSize(double fontSize) {
    emit(state.copyWith(fontSize: fontSize));
  }

  void increaseFontSize() {
    emit(state.copyWith(fontSize: state.fontSize < 40 ? state.fontSize + 1 : 40));
  }

  void decreaseFontSize() {
    emit(state.copyWith(fontSize: state.fontSize > 16 ? state.fontSize - 1 : 16));
  }

  void changeBackground(BackgroundType backgroundType) {
    switch (backgroundType) {
      case BackgroundType.black:
        emit(state.copyWith(background: Colors.black, textColors: Colors.white));
        break;
      case BackgroundType.white:
        emit(state.copyWith(background: Colors.white, textColors: Colors.black));
        break;
      case BackgroundType.green:
        emit(state.copyWith(
            background: const Color(0xFF51643B), textColors: const Color(0xFFBAD3AC)));
        break;
    }
  }

  void changFontFamily(FontFamilyState fontFamilyState){
    switch (fontFamilyState) {
      case FontFamilyState.roboto:
        emit(state.copyWith(fontFamily: 'Roboto'));
        break;
      case FontFamilyState.ysabeau:
        emit(state.copyWith(fontFamily: 'Ysabeau'));
        break;
    }
  }
}
