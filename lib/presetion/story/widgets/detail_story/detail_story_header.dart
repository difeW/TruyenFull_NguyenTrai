import 'package:client_app/presetion/story/widgets/widgets/story_card_widget.dart';
import 'package:client_app/theme/font/font_text.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/space/space.dart';

class DetailStoryHeader extends StatelessWidget {
  final String linkImage;
  final String nameStory;
  const DetailStoryHeader({Key? key, required this.linkImage, required this.nameStory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoryCardWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImage(),
        Space.normal,
        _buildTitle(),
      ],
    ));
  }

  Widget _buildImage() {
    const sizeImage = 150.0;
    return Container(
      clipBehavior: Clip.hardEdge,
      width: sizeImage,
      height: sizeImage,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(sizeImage/2))
      ),
      child: Image.network(linkImage, fit: BoxFit.cover,),
    );
  }

  Widget _buildTitle() {
    return Text(
      nameStory,
      style: FontText.title,
      textAlign: TextAlign.center,
    );
  }
}
