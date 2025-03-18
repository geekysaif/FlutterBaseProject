// products_details_response.dart
// repo: https://github.com/januwA/p5_object_2_builtvalue
// generate: https://januwa.github.io/p5_object_2_builtvalue/index.html

library products_details_response;

import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../serializers.dart';

part 'products_details_response.g.dart';

// {"id":1,"title":"Essence Mascara Lash Princess","description":"The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.","category":"beauty","price":9.99,"discountPercentage":7.17,"rating":4.94,"stock":5,"productTags":["beauty","mascara"],"brand":"Essence","sku":"RCH45Q1A","weight":2,"productDimensions":{"width":23.17,"height":14.43,"depth":28.01},"warrantyInformation":"1 month warranty","shippingInformation":"Ships in 1 month","availabilityStatus":"Low Stock","productReviews":[{"rating":2,"comment":"Very unhappy with my purchase!","date":"2024-05-23T08:56:21.618Z","reviewerName":"John Doe","reviewerEmail":"john.doe@x.dummyjson.com"},{"rating":2,"comment":"Not as described!","date":"2024-05-23T08:56:21.618Z","reviewerName":"Nolan Gonzalez","reviewerEmail":"nolan.gonzalez@x.dummyjson.com"},{"rating":5,"comment":"Very satisfied!","date":"2024-05-23T08:56:21.618Z","reviewerName":"Scarlett Wright","reviewerEmail":"scarlett.wright@x.dummyjson.com"}],"returnPolicy":"30 days return policy","minimumOrderQuantity":24,"productMeta":{"createdAt":"2024-05-23T08:56:21.618Z","updatedAt":"2024-05-23T08:56:21.618Z","barcode":"9164035109868","qrCode":"..."},"thumbnail":"...","productImages":["...","...","..."]}


/// ProductsDetailsResponse
abstract class ProductsDetailsResponse implements Built<ProductsDetailsResponse, ProductsDetailsResponseBuilder> {
  ProductsDetailsResponse._();

  factory ProductsDetailsResponse([Function(ProductsDetailsResponseBuilder b) updates]) = _$ProductsDetailsResponse;

  
  @BuiltValueField(wireName: 'id')
  int? get id;

  
  @BuiltValueField(wireName: 'title')
  String? get title;

  
  @BuiltValueField(wireName: 'description')
  String? get description;

  
  @BuiltValueField(wireName: 'category')
  String? get category;

  
  @BuiltValueField(wireName: 'price')
  double? get price;

  
  @BuiltValueField(wireName: 'discountPercentage')
  double? get discountPercentage;

  
  @BuiltValueField(wireName: 'rating')
  double? get rating;

  
  @BuiltValueField(wireName: 'stock')
  int? get stock;

  
  @BuiltValueField(wireName: 'tags')
  BuiltList<String>? get productTags;

  
  @BuiltValueField(wireName: 'brand')
  String? get brand;

  
  @BuiltValueField(wireName: 'sku')
  String? get sku;

  
  @BuiltValueField(wireName: 'weight')
  int? get weight;

  
  @BuiltValueField(wireName: 'dimensions')
  ProductDimensionsDto? get productDimensions;

  
  @BuiltValueField(wireName: 'warrantyInformation')
  String? get warrantyInformation;

  
  @BuiltValueField(wireName: 'shippingInformation')
  String? get shippingInformation;

  
  @BuiltValueField(wireName: 'availabilityStatus')
  String? get availabilityStatus;

  
  @BuiltValueField(wireName: 'reviews')
  BuiltList<ProductReviewsDto>? get productReviews;

  
  @BuiltValueField(wireName: 'returnPolicy')
  String? get returnPolicy;

  
  @BuiltValueField(wireName: 'minimumOrderQuantity')
  int? get minimumOrderQuantity;

  
  @BuiltValueField(wireName: 'meta')
  ProductMetaDto? get productMeta;

  
  @BuiltValueField(wireName: 'thumbnail')
  String? get thumbnail;

  
  @BuiltValueField(wireName: 'images')
  BuiltList<String>? get productImages;


  String toJson() {
    return jsonEncode(serializers.serializeWith(ProductsDetailsResponse.serializer, this));
  }

  static ProductsDetailsResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProductsDetailsResponse.serializer, jsonDecode(jsonString))!.rebuild(
            (b) => b..id ??= 0
          ..title ??= ''
          ..description ??= ''
          ..category ??= ''
          ..price ??= 0
          ..discountPercentage ??= 0
          ..rating ??= 0
          ..stock ??= 0
          ..productTags ??=  ListBuilder<String>()
          ..brand ??= ''
          ..sku ??= ''
          ..weight ??= 0
          ..productDimensions.width ??= 0
          ..productDimensions.height ??= 0
          ..productDimensions.depth ??= 0
          ..warrantyInformation ??= ''
          ..shippingInformation ??= ''
          ..availabilityStatus ??= ''
          ..productReviews ??=  ListBuilder<ProductReviewsDto>()
          ..returnPolicy ??= ''
          ..minimumOrderQuantity ??= 0
          ..productMeta.createdAt ??= ''
          ..productMeta.updatedAt ??= ''
          ..productMeta.barcode ??= ''
          ..productMeta.qrCode ??= ''
          ..thumbnail ??= ''
          ..productImages ??=  ListBuilder<String>()
    );
  }

  static List<ProductsDetailsResponse> fromListJson(String jsonString) {
    return jsonDecode(jsonString)
        .map<ProductsDetailsResponse>((e) => fromJson(jsonEncode(e)))
        .toList();
  }

  static Serializer<ProductsDetailsResponse> get serializer => _$productsDetailsResponseSerializer;
}

/// ProductDimensionsDto
abstract class ProductDimensionsDto implements Built<ProductDimensionsDto, ProductDimensionsDtoBuilder> {
  ProductDimensionsDto._();

  factory ProductDimensionsDto([Function(ProductDimensionsDtoBuilder b) updates]) = _$ProductDimensionsDto;

  
  @BuiltValueField(wireName: 'width')
  double? get width;

  
  @BuiltValueField(wireName: 'height')
  double? get height;

  
  @BuiltValueField(wireName: 'depth')
  double? get depth;


  String toJson() {
    return jsonEncode(serializers.serializeWith(ProductDimensionsDto.serializer, this));
  }

  static ProductDimensionsDto? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProductDimensionsDto.serializer, jsonDecode(jsonString));
  }

  static List<ProductDimensionsDto> fromListJson(String jsonString) {
    return jsonDecode(jsonString)
        .map<ProductDimensionsDto>((e) => fromJson(jsonEncode(e)))
        .toList();
  }

  static Serializer<ProductDimensionsDto> get serializer => _$productDimensionsDtoSerializer;
}

/// ProductReviewsDto
abstract class ProductReviewsDto implements Built<ProductReviewsDto, ProductReviewsDtoBuilder> {
  ProductReviewsDto._();

  factory ProductReviewsDto([Function(ProductReviewsDtoBuilder b) updates]) = _$ProductReviewsDto;

  
  @BuiltValueField(wireName: 'rating')
  int? get rating;

  
  @BuiltValueField(wireName: 'comment')
  String? get comment;

  
  @BuiltValueField(wireName: 'date')
  String? get date;

  
  @BuiltValueField(wireName: 'reviewerName')
  String? get reviewerName;

  
  @BuiltValueField(wireName: 'reviewerEmail')
  String? get reviewerEmail;


  String toJson() {
    return jsonEncode(serializers.serializeWith(ProductReviewsDto.serializer, this));
  }

  static ProductReviewsDto? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProductReviewsDto.serializer, jsonDecode(jsonString));
  }

  static List<ProductReviewsDto> fromListJson(String jsonString) {
    return jsonDecode(jsonString)
        .map<ProductReviewsDto>((e) => fromJson(jsonEncode(e)))
        .toList();
  }

  static Serializer<ProductReviewsDto> get serializer => _$productReviewsDtoSerializer;
}

/// ProductMetaDto
abstract class ProductMetaDto implements Built<ProductMetaDto, ProductMetaDtoBuilder> {
  ProductMetaDto._();

  factory ProductMetaDto([Function(ProductMetaDtoBuilder b) updates]) = _$ProductMetaDto;

  
  @BuiltValueField(wireName: 'createdAt')
  String? get createdAt;

  
  @BuiltValueField(wireName: 'updatedAt')
  String? get updatedAt;

  
  @BuiltValueField(wireName: 'barcode')
  String? get barcode;

  
  @BuiltValueField(wireName: 'qrCode')
  String? get qrCode;


  String toJson() {
    return jsonEncode(serializers.serializeWith(ProductMetaDto.serializer, this));
  }

  static ProductMetaDto? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProductMetaDto.serializer, jsonDecode(jsonString));
  }

  static List<ProductMetaDto> fromListJson(String jsonString) {
    return jsonDecode(jsonString)
        .map<ProductMetaDto>((e) => fromJson(jsonEncode(e)))
        .toList();
  }

  static Serializer<ProductMetaDto> get serializer => _$productMetaDtoSerializer;
}