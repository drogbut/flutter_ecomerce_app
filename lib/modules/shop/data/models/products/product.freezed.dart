// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get categoryId => throw _privateConstructorUsedError;
  List<ProductColorModel> get colors => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  Timestamp get createdDate => throw _privateConstructorUsedError;
  num get discountedPrice => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  List<String> get sizes => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  int get salesNumber => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String categoryId,
      List<ProductColorModel> colors,
      @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
      Timestamp createdDate,
      num discountedPrice,
      int gender,
      List<String> images,
      num price,
      List<String> sizes,
      String productId,
      int salesNumber,
      String title});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? colors = null,
    Object? createdDate = null,
    Object? discountedPrice = null,
    Object? gender = null,
    Object? images = null,
    Object? price = null,
    Object? sizes = null,
    Object? productId = null,
    Object? salesNumber = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ProductColorModel>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      discountedPrice: null == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as num,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      sizes: null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      salesNumber: null == salesNumber
          ? _value.salesNumber
          : salesNumber // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryId,
      List<ProductColorModel> colors,
      @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
      Timestamp createdDate,
      num discountedPrice,
      int gender,
      List<String> images,
      num price,
      List<String> sizes,
      String productId,
      int salesNumber,
      String title});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? colors = null,
    Object? createdDate = null,
    Object? discountedPrice = null,
    Object? gender = null,
    Object? images = null,
    Object? price = null,
    Object? sizes = null,
    Object? productId = null,
    Object? salesNumber = null,
    Object? title = null,
  }) {
    return _then(_$ProductModelImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ProductColorModel>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      discountedPrice: null == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as num,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      sizes: null == sizes
          ? _value._sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      salesNumber: null == salesNumber
          ? _value.salesNumber
          : salesNumber // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {required this.categoryId,
      required final List<ProductColorModel> colors,
      @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
      required this.createdDate,
      required this.discountedPrice,
      required this.gender,
      required final List<String> images,
      required this.price,
      required final List<String> sizes,
      required this.productId,
      required this.salesNumber,
      required this.title})
      : _colors = colors,
        _images = images,
        _sizes = sizes;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String categoryId;
  final List<ProductColorModel> _colors;
  @override
  List<ProductColorModel> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final Timestamp createdDate;
  @override
  final num discountedPrice;
  @override
  final int gender;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final num price;
  final List<String> _sizes;
  @override
  List<String> get sizes {
    if (_sizes is EqualUnmodifiableListView) return _sizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sizes);
  }

  @override
  final String productId;
  @override
  final int salesNumber;
  @override
  final String title;

  @override
  String toString() {
    return 'ProductModel(categoryId: $categoryId, colors: $colors, createdDate: $createdDate, discountedPrice: $discountedPrice, gender: $gender, images: $images, price: $price, sizes: $sizes, productId: $productId, salesNumber: $salesNumber, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._sizes, _sizes) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.salesNumber, salesNumber) ||
                other.salesNumber == salesNumber) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      categoryId,
      const DeepCollectionEquality().hash(_colors),
      createdDate,
      discountedPrice,
      gender,
      const DeepCollectionEquality().hash(_images),
      price,
      const DeepCollectionEquality().hash(_sizes),
      productId,
      salesNumber,
      title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {required final String categoryId,
      required final List<ProductColorModel> colors,
      @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
      required final Timestamp createdDate,
      required final num discountedPrice,
      required final int gender,
      required final List<String> images,
      required final num price,
      required final List<String> sizes,
      required final String productId,
      required final int salesNumber,
      required final String title}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get categoryId;
  @override
  List<ProductColorModel> get colors;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  Timestamp get createdDate;
  @override
  num get discountedPrice;
  @override
  int get gender;
  @override
  List<String> get images;
  @override
  num get price;
  @override
  List<String> get sizes;
  @override
  String get productId;
  @override
  int get salesNumber;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
