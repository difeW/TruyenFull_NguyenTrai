import 'package:client_app/data/models/story_detail_model.dart';
import 'package:client_app/data/models/story_model.dart';
import 'package:client_app/presetion/story/bloc/detail_story/detail_story_bloc.dart';
import 'package:client_app/presetion/story/bloc/list_story/list_story_bloc.dart';
import 'package:client_app/presetion/story/widgets/detail_story/detail_story_description.dart';
import 'package:client_app/presetion/story/widgets/detail_story/detail_story_info.dart';
import 'package:client_app/widgets/loading/loadingWidget.dart';
import 'package:flutter/material.dart';

import '../../../data/models/chapter_model.dart';
import '../../../theme/font/font_text.dart';
import '../../../widgets/space/space.dart';
import '../widgets/detail_story/detail_story_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/detail_story/detail_story_list_chapter.dart';

class DetailStoryScreen extends StatelessWidget {
  final StoryModel storyModel;

  const DetailStoryScreen({Key? key, required this.storyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailStoryBloc, DetailStoryState>(
      builder: (context, state) {
        late Widget body;

        switch (state.runtimeType) {
          case DetailStoryLoading:
            body = const LoadingWidget();
            break;
          case DetailStoryHasData:
            final story = (state as DetailStoryHasData).storyDetailModel;
            final listChapter = state.chapters;
            body = _buildDetailStory(story, listChapter, context);
            break;
        }

        return Scaffold(body: body);
      },
    );
  }

  Widget _buildDetailStory(
      StoryDetailModel storyModel, List<ChapterModel> listChapter, BuildContext context) {
    final infoStory = InfoStory(
      numOfChapter: listChapter.length,
      rateCount: storyModel.rateCount,
      rate: storyModel.rateAvg,
      type: storyModel.categoryList ?? [],
      status: storyModel.status ?? "",
      author: storyModel.author ?? "",
      createAt: DateTime.parse(storyModel.uploadDate ?? ""),
      updateAt: DateTime.parse(storyModel.updatedDate ?? ""),
    );

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DetailStoryHeader(
                linkImage: storyModel.poster ?? "", nameStory: storyModel.title ?? ""),
            Space.normal,
            DetailStoryInfo(infoStory: infoStory),
            Space.normal,
            _buildButtonReadStory(context, listChapter.map((e) => e.id ?? 0).toList()),
            Space.normal,
            DetailStoryDescription(description: storyModel.description ?? []),
            Space.normal,
            DetailStoryListChapter(
              listChapter: [...listChapter],
            )
            // _buildChapterStory(),
          ],
        ),
      ),
    ));
  }

  Widget _buildButtonReadStory(BuildContext context, List<int> listIDChapter) {
    return SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width / 3 * 2,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            onPressed: () {
              context
                  .read<DetailStoryBloc>()
                  .add(OnPressButtonReadStory(Navigator.of(context), listIDChapter));
            },
            child: Text(
              "Đọc truyện",
              style: FontText.title,
            )));
  }
}
