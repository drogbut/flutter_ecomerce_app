import '../../../data/models/category_model.dart';

abstract class CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final CategoryModel categories;
  CategoryLoaded({required this.categories});
}

class CategoryFailure extends CategoryState {
  final String errorMessage;
  CategoryFailure({required this.errorMessage});
}
