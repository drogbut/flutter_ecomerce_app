// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      categoryId: json['categoryId'] as String,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ProductColorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdDate: _timestampFromJson(json['createdDate']),
      discountedPrice: json['discountedPrice'] as num,
      gender: (json['gender'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as num,
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      productId: json['productId'] as String,
      salesNumber: (json['salesNumber'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'colors': instance.colors,
      'createdDate': _timestampToJson(instance.createdDate),
      'discountedPrice': instance.discountedPrice,
      'gender': instance.gender,
      'images': instance.images,
      'price': instance.price,
      'sizes': instance.sizes,
      'productId': instance.productId,
      'salesNumber': instance.salesNumber,
      'title': instance.title,
    };
