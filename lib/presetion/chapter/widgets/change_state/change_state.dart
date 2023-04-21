import 'package:client_app/bloc/state_font_of_chapter/state_font_of_chapter_cubit.dart';
import 'package:client_app/presetion/chapter/widgets/change_state/change_background.dart';
import 'package:client_app/presetion/chapter/widgets/change_state/change_fontSize.dart';
import 'package:client_app/presetion/chapter/widgets/change_state/item_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/font/font_text.dart';
import '../../../../widgets/space/space.dart';
import 'change_font_family.dart';

class ChangeState extends StatefulWidget {
  final bool hidden;
  const ChangeState({Key? key, required this.hidden}) : super(key: key);

  @override
  State<ChangeState> createState() => _ChangeStateState();
}

class _ChangeStateState extends State<ChangeState> {
  late bool hidden;

  @override
  void initState() {
    hidden = widget.hidden;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChangeState oldWidget) {
    if (oldWidget.hidden != widget.hidden) {
      setState(() {
        hidden = widget.hidden;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  final double heightWidget = 210;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: hidden ? 0 : -heightWidget,
      left: 0,
      duration: const Duration(milliseconds: 200),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: heightWidget
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.7),
          child: Column(
            children: [
              const ChangeFontSize(),
              Space.normal,
              const ChangeBackground(),
              Space.normal,
              const ChangeFontFamily(),
            ],
          ),
        ),
      ),
    );
  }
}
