import 'package:equatable/equatable.dart';

import '../../data/models/category_model.dart';

class CategoriesState extends Equatable {
  final bool isLoading;
  final List<CategoryModel> allCategories;
  final List<CategoryModel> featuredCategories;
  final String? errorMessage;

  const CategoriesState({
    this.isLoading = false,
    this.allCategories = const [],
    this.featuredCategories = const [],
    this.errorMessage,
  });

  CategoriesState copyWith({
    bool? isLoading,
    List<CategoryModel>? allCategories,
    List<CategoryModel>? featuredCategories,
    String? errorMessage,
  }) {
    return CategoriesState(
      isLoading: isLoading ?? this.isLoading,
      allCategories: allCategories ?? this.allCategories,
      featuredCategories: featuredCategories ?? this.featuredCategories,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, allCategories, featuredCategories, errorMessage];
}

