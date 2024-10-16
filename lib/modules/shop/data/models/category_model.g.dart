// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as String,
      image: json['image'] as String,
      isFeatured: json['isFeatured'] as bool,
      name: json['name'] as String,
      parentId: json['parentId'] as String,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'isFeatured': instance.isFeatured,
      'name': instance.name,
      'parentId': instance.parentId,
    };
