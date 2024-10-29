import 'package:get/get.dart';

import '../../../../../utilities/popups/loaders.dart';
import '../../data/models/category_model.dart';
import '../../data/repository/category_repository.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();
  final _categoryRepository = Get.put(CategoryRepository());

  /// Variables
  var isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// Fetch categories from the repository and update the state
  Future<void> fetchCategories() async {
    try {
      // Set loading to true
      isLoading.value = true;

      // Fetch categories from datasource
      var categories = await _categoryRepository.getAllCategories();

      // Update categories with fetched data
      allCategories.assignAll(categories);

      //  Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && (category.parentId == null || category.parentId == ''))
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Error to fetch categories', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
