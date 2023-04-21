part of 'list_category_bloc.dart';

@immutable
abstract class ListCategoryState {

}

class ListCategoryHasData extends ListCategoryState {
  final List<CategoryModel>? categories;
  ListCategoryHasData(this.categories);
}

class ListCategoryLoading extends ListCategoryState{}

class ListCategoryError extends ListCategoryState{}
