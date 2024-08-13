import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_item.freezed.dart';
part 'category_item.g.dart';

@freezed
class CategoryItem with _$CategoryItem {
  const factory CategoryItem({
    required String? id,
    required String? title,
    required String? imagePfad,
  }) = _CategoryItem;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => _$CategoryItemFromJson(json);
}
