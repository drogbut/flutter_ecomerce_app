import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'product_color.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String categoryId,
    required List<ProductColorModel> colors,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) required Timestamp createdDate,
    required num discountedPrice,
    required int gender,
    required List<String> images,
    required num price,
    required List<String> sizes,
    required String productId,
    required int salesNumber,
    required String title,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

// Custom fromJson method
Timestamp _timestampFromJson(dynamic json) {
  return json is Timestamp ? json : Timestamp.fromMillisecondsSinceEpoch(json as int);
}

// Custom toJson method
int _timestampToJson(Timestamp timestamp) => timestamp.millisecondsSinceEpoch;
