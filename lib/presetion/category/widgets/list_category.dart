import 'package:client_app/presetion/category/widgets/item_category.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';
import '../../../theme/font/font_text.dart';

class ListCategory extends StatelessWidget {
  final List<CategoryModel> listCategory;
  const ListCategory({Key? key, required this.listCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Wrap(
          children: listCategory
              .map((e) => ItemCategory(category: e))
              .toList(),
        ),
      ),
    );
  }
}
