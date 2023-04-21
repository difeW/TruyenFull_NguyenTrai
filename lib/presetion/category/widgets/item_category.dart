import 'package:client_app/data/models/category_model.dart';
import 'package:client_app/presetion/category/bloc/list_category/list_category_bloc.dart';
import 'package:client_app/theme/font/font_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCategory extends StatelessWidget {
  final CategoryModel category;
  const ItemCategory({Key? key, required this.category}) : super(key: key);

  void onPressItem(BuildContext context) {
    context.read<ListCategoryBloc>().add(
          OnPressItemCategory(
            category: category,
            navigatorState: Navigator.of(context)
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    // 48 = 16*3
    final sizeWidgetOfItem = (MediaQuery.of(context).size.width - 48) / 2;
    final nameItem = category.name;

    return Container(
      margin: const EdgeInsets.all(8),
      width: sizeWidgetOfItem,
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.silver.withOpacity(0.5),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          onPressed: () {
            onPressItem(context);
          },
          child: Text(
            nameItem ?? "",
            style: FontText.labelLarge.normal,
          )),
    );
  }
}
