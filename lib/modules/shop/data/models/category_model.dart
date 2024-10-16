import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String image,
    required bool isFeatured,
    required String name,
    required String parentId,
  }) = _CategoryModel;

  // Empty categories
  factory CategoryModel.empty() => const CategoryModel(id: '', image: '', isFeatured: false, name: '', parentId: '');

  // Factory to create a template from a DocumentSnapshot
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data != null) {
      return CategoryModel(
        id: document.id,
        image: data['image'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
        name: data['name'] ?? '',
        parentId: data['parentId'] ?? '',
      );
    } else {
      return CategoryModel.empty();
    }
  }

  // Generating functions for serialisation
  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}
