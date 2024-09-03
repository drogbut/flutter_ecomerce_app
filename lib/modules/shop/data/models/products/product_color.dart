import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_color.freezed.dart';
part 'product_color.g.dart';

@freezed
class ProductColorModel with _$ProductColorModel {
  const factory ProductColorModel({
    required String title,
    required String hexCode,
  }) = _ProductColorModel;

  factory ProductColorModel.fromJson(Map<String, dynamic> json) => _$ProductColorModelFromJson(json);
}
