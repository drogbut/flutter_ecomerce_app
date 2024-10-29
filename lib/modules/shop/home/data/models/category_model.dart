import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    String? name,
    String? image,
    String? parentId,
    required bool isFeatured,
  }) = _CategoryModel;

  // Empty constructor
  factory CategoryModel.empty() => const CategoryModel(
        id: '',
        name: '',
        image: '',
        parentId: null,
        isFeatured: false,
      );

  // Factory to create a template from a DocumentSnapshot<Map<String, dynamic>>.
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    if (data != null) {
      return CategoryModel(
        id: snapshot.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        parentId: data['parentId'],
        isFeatured: data['isFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }

  // Generating functions for serialization
  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}
