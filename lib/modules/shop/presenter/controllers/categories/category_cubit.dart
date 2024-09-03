import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../locator.dart';
import '../../../domain/use_cases/get_categories.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());

  void displayCategories() async {
    var categoriesResponse = await sl<GetCategoriesUseCase>().call();

    categoriesResponse.fold((error) {
      emit(
        CategoryFailure(errorMessage: error),
      );
    }, (data) {
      emit(
        CategoryLoaded(categories: data),
      );
    });
  }
}
