import 'package:bloc/bloc.dart';
import 'package:client_app/core/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/response/category_response.dart';

part 'list_category_event.dart';
part 'list_category_state.dart';

class ListCategoryBloc extends Bloc<ListCategoryEvent, ListCategoryState> {
  final CategoryResponse _categoryResponse;

  ListCategoryBloc(this._categoryResponse) : super(ListCategoryLoading()) {
    on<GetCategories>((event, emit) async {
      emit(ListCategoryLoading());
      try{
        final categories = await _categoryResponse.getCategories();
        emit(ListCategoryHasData(categories));
      }catch(e){
        emit(ListCategoryError());
      }
    });

    on<OnPressItemCategory>((event, emit) {
      event.navigatorState.pushNamed(
        RouteManager.listStoryScreen,
        arguments: event.category,
      );
    });
  }
}
