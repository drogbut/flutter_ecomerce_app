import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/category_repository.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository _categoryRepository;

  CategoriesCubit(this._categoryRepository) : super(const CategoriesState()) {
    fetchCategories();
  }

  /// Fetch categories from the repository and update the state
  Future<void> fetchCategories() async {
    try {
      emit(state.copyWith(isLoading: true));

      // Fetch categories from datasource
      final categories = await _categoryRepository.getAllCategories();

      // Filter featured categories
      final featured = categories
          .where((category) => category.isFeatured && (category.parentId == null || category.parentId == ''))
          .take(8)
          .toList();

      emit(state.copyWith(
        isLoading: false,
        allCategories: categories,
        featuredCategories: featured,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
      // Error will be handled by BlocListener in the widget
    }
  }
}

