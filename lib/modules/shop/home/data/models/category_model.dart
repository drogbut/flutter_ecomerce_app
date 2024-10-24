import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    required String image,
    required String parentId,
    required bool isFeatured,
  }) = _CategoryModel;

  // Constructeur vide
  factory CategoryModel.empty() => const CategoryModel(
        id: '',
        name: '',
        image: '',
        parentId: '',
        isFeatured: false,
      );

  // Factory pour créer un modèle à partir d'un DocumentSnapshot<Map<String, dynamic>>
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    // Si les données ne sont pas nulles, crée la catégorie, sinon retourne une catégorie vide
    if (data != null) {
      return CategoryModel(
        id: snapshot.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }

  // Génération des fonctions pour la sérialisation
  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}
