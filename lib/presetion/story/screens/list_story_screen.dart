import 'dart:async';

import 'package:client_app/data/models/category_model.dart';
import 'package:client_app/presetion/story/widgets/list_story/list_story_page_number.dart';
import 'package:client_app/theme/font/font_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../widgets/loading/loadingWidget.dart';
import '../bloc/list_story/list_story_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/list_story/list_story.dart';

class ListStoryScreen extends StatelessWidget {
  final CategoryModel category;
  ListStoryScreen({Key? key, required this.category}) : super(key: key);

  final ScrollController controller = ScrollController();

  /// stream hidden
  final StreamController<bool> hiddenController = StreamController<bool>();
  Stream<bool> get hiddenStream => hiddenController.stream;
  Sink<bool> get hiddenSink => hiddenController.sink;

  bool _onListenNotification(
    ScrollNotification scrollNotification,
    ListStoryState state,
    BuildContext context,
  ) {
    ///handle loadMore
    if (scrollNotification is ScrollEndNotification) {
      if (controller.position.extentAfter == 0) {
        if (state.loadMore == true) {
          context.read<ListStoryBloc>().add(OnLoadMoreStories());
        }
      }
    }

    /// handle scroll
    if (controller.position.userScrollDirection == ScrollDirection.forward) {
      hiddenSink.add(false);
    }
    else if (controller.position.userScrollDirection == ScrollDirection.reverse) {
      hiddenSink.add(true);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListStoryBloc, ListStoryState>(
      builder: (context, state) {
        late Widget body;
        switch (state.runtimeType) {
          case ListStoryLoading:
            body = const LoadingWidget();
            break;
          case ListStoryHasData:
            final listStory = (state as ListStoryHasData).stories;
            body = listStory!.isNotEmpty? ListStory(
                listStory: listStory, controller: controller): _listEmpty();
            break;
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) => _onListenNotification(
            notification,
            state,
            context,
          ),
          child: Scaffold(
            floatingActionButton:StreamBuilder<bool>(
              stream: hiddenStream,
              builder: (context, snapshot) {
                return ListStoryPageNumber(hidden: snapshot.data, numPage: state.page);
              }
            ),
            appBar: _buildAppBar(context),
            body: body,
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 3,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      title: Text(
        category.name ?? "",
        style: FontText.header.primary,
      ),
    );
  }

  Widget _listEmpty(){
    return Center(
      child: Text("Danh sách trống", style: FontText.labelLarge,),
    );
  }
}
