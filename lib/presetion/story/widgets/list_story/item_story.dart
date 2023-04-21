import 'package:client_app/data/models/story_model.dart';
import 'package:client_app/presetion/story/bloc/list_story/list_story_bloc.dart';
import 'package:client_app/theme/font/font_text.dart';
import 'package:client_app/theme/image_path_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../detail_story/detail_story_info.dart';

class ItemStory extends StatelessWidget {
  final StoryModel story;
  const ItemStory({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ListStoryBloc>().add(OnPressItemStory(story, Navigator.of(context)));
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 100
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColor.silver.withOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Container(
                width: 84,
                height: 84,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(PathIcons.bookLoading),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                child: Image.network(
                  story.poster ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: FontText.labelLarge,
                    ),
                    Text(
                      story.author ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: FontText.bodySmall,
                    ),
                    Text(
                      story.status ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: FontText.bodySmall,
                    ),
                    Text(
                      "${DateTime.parse(story.uploadDate??"").toDDMMYYYY} - ${DateTime.parse(story.updatedDate??"").toDDMMYYYY}",
                      overflow: TextOverflow.ellipsis,
                      style: FontText.bodySmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

