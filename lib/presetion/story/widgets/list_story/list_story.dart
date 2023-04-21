import 'package:flutter/material.dart';

import '../../../../data/models/story_model.dart';
import '../../../../widgets/space/space.dart';
import 'item_story.dart';

class ListStory extends StatelessWidget {
  final ScrollController controller;
  final List<StoryModel> listStory;
  const ListStory({Key? key, required this.controller, required this.listStory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: listStory
              .map(
                (e) => Column(
                  children: [
                    Space.normal,
                    e.id != null
                        ? ItemStory(
                            story: e,
                          )
                        : Container(
                            height: 70,
                          ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
