import 'package:client_app/presetion/category/bloc/list_category/list_category_bloc.dart';
import 'package:client_app/theme/font/font_text.dart';
import 'package:client_app/widgets/loading/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/error_widget/error_network.dart';
import '../widgets/list_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCategoryBloc, ListCategoryState>(
      builder: (context, state) {
        late Widget body;
        switch (state.runtimeType) {
          case ListCategoryLoading:
            body = const LoadingWidget();
            break;
          case ListCategoryHasData:
            body = RefreshIndicator(
                onRefresh: () async {
                  context.read<ListCategoryBloc>().add(GetCategories());
                },
                child: ListCategory(listCategory: (state as ListCategoryHasData).categories ?? []));
            break;
          default:
            body = ErrorNetworkWidget(callback: (){
              context.read<ListCategoryBloc>().add(GetCategories());
            },);
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBar(),
          body: body,
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text("Danh Mục", style: FontText.header.primary),
      leading: null,
      leadingWidth: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 3,
    );
  }
}
