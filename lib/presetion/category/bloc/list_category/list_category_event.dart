part of 'list_category_bloc.dart';

@immutable
abstract class ListCategoryEvent {}

class GetCategories extends ListCategoryEvent {}

class OnPressItemCategory extends ListCategoryEvent {
  final CategoryModel category;
  final NavigatorState navigatorState;
  OnPressItemCategory( {
    required this.category,
    required this.navigatorState,
  });
}
