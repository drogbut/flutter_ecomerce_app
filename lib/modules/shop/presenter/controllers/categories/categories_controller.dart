import 'package:get/get.dart';

import '../../../../../utilities/popups/loaders.dart';
import '../../../data/models/category_model.dart';
import '../../../data/repository/category_repository.dart';

class CategoriesController extends GetxController {
  /// Instance of CategoryRepository
  static CategoriesController get instance => Get.find();

  ///================ variables ========================================
  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  ///================ initialize ========================================
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// Fetch categories from the repository and update the state
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();

      // Update all categories with fetched data
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(
        allCategories.where((category) => category.isFeatured && category.parentId.isNotEmpty).take(8).toList(),
      );
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Oh error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
