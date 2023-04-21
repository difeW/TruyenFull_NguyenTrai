import 'package:client_app/presetion/story/widgets/widgets/story_card_widget.dart';
import 'package:flutter/material.dart';

class DetailStoryDescription extends StatefulWidget {
  final List<String> description;
  const DetailStoryDescription({Key? key, required this.description}) : super(key: key);

  @override
  State<DetailStoryDescription> createState() => _DetailStoryDescriptionState();
}

class _DetailStoryDescriptionState extends State<DetailStoryDescription> {
  late List<String> description;

  bool showFull = false;

  @override
  void initState() {
    description = widget.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return description.length > 8
        ? (showFull
            ? _buildShowFull()
            : _buildShowLess())
        : _buildShowFull();
  }

  Widget _buildShowFull() {
    return StoryCardWidget(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: description
          .map((e) => Text(
                e,
                textAlign: TextAlign.start,
              ))
          .toList(),
    ));
  }

  Widget _buildShowLess() {
    return StoryCardWidget(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...description
            .sublist(0, 8)
            .map((e) => Text(
                  e,
                  textAlign: TextAlign.start,
                ))
            .toList(),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              setState(() {
                showFull = true;
              });
            },
            child: const Icon(Icons.arrow_drop_down_outlined),
          ),
        )
      ],
    ));
  }
}
