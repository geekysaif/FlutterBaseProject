// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_details_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductsDetailsResponse> _$productsDetailsResponseSerializer =
    new _$ProductsDetailsResponseSerializer();
Serializer<ProductDimensionsDto> _$productDimensionsDtoSerializer =
    new _$ProductDimensionsDtoSerializer();
Serializer<ProductReviewsDto> _$productReviewsDtoSerializer =
    new _$ProductReviewsDtoSerializer();
Serializer<ProductMetaDto> _$productMetaDtoSerializer =
    new _$ProductMetaDtoSerializer();

class _$ProductsDetailsResponseSerializer
    implements StructuredSerializer<ProductsDetailsResponse> {
  @override
  final Iterable<Type> types = const [
    ProductsDetailsResponse,
    _$ProductsDetailsResponse
  ];
  @override
  final String wireName = 'ProductsDetailsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ProductsDetailsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.discountPercentage;
    if (value != null) {
      result
        ..add('discountPercentage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.stock;
    if (value != null) {
      result
        ..add('stock')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.productTags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.brand;
    if (value != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sku;
    if (value != null) {
      result
        ..add('sku')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.productDimensions;
    if (value != null) {
      result
        ..add('dimensions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ProductDimensionsDto)));
    }
    value = object.warrantyInformation;
    if (value != null) {
      result
        ..add('warrantyInformation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shippingInformation;
    if (value != null) {
      result
        ..add('shippingInformation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.availabilityStatus;
    if (value != null) {
      result
        ..add('availabilityStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productReviews;
    if (value != null) {
      result
        ..add('reviews')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ProductReviewsDto)])));
    }
    value = object.returnPolicy;
    if (value != null) {
      result
        ..add('returnPolicy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minimumOrderQuantity;
    if (value != null) {
      result
        ..add('minimumOrderQuantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.productMeta;
    if (value != null) {
      result
        ..add('meta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ProductMetaDto)));
    }
    value = object.thumbnail;
    if (value != null) {
      result
        ..add('thumbnail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productImages;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  ProductsDetailsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsDetailsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'discountPercentage':
          result.discountPercentage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'stock':
          result.stock = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'tags':
          result.productTags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sku':
          result.sku = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'dimensions':
          result.productDimensions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ProductDimensionsDto))!
              as ProductDimensionsDto);
          break;
        case 'warrantyInformation':
          result.warrantyInformation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shippingInformation':
          result.shippingInformation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'availabilityStatus':
          result.availabilityStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reviews':
          result.productReviews.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductReviewsDto)]))!
              as BuiltList<Object?>);
          break;
        case 'returnPolicy':
          result.returnPolicy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'minimumOrderQuantity':
          result.minimumOrderQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'meta':
          result.productMeta.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ProductMetaDto))!
              as ProductMetaDto);
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'images':
          result.productImages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ProductDimensionsDtoSerializer
    implements StructuredSerializer<ProductDimensionsDto> {
  @override
  final Iterable<Type> types = const [
    ProductDimensionsDto,
    _$ProductDimensionsDto
  ];
  @override
  final String wireName = 'ProductDimensionsDto';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ProductDimensionsDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.width;
    if (value != null) {
      result
        ..add('width')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.depth;
    if (value != null) {
      result
        ..add('depth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  ProductDimensionsDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductDimensionsDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'depth':
          result.depth = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductReviewsDtoSerializer
    implements StructuredSerializer<ProductReviewsDto> {
  @override
  final Iterable<Type> types = const [ProductReviewsDto, _$ProductReviewsDto];
  @override
  final String wireName = 'ProductReviewsDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductReviewsDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reviewerName;
    if (value != null) {
      result
        ..add('reviewerName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reviewerEmail;
    if (value != null) {
      result
        ..add('reviewerEmail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ProductReviewsDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductReviewsDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reviewerName':
          result.reviewerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reviewerEmail':
          result.reviewerEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductMetaDtoSerializer
    implements StructuredSerializer<ProductMetaDto> {
  @override
  final Iterable<Type> types = const [ProductMetaDto, _$ProductMetaDto];
  @override
  final String wireName = 'ProductMetaDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductMetaDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.barcode;
    if (value != null) {
      result
        ..add('barcode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.qrCode;
    if (value != null) {
      result
        ..add('qrCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ProductMetaDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductMetaDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'barcode':
          result.barcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'qrCode':
          result.qrCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductsDetailsResponse extends ProductsDetailsResponse {
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final double? price;
  @override
  final double? discountPercentage;
  @override
  final double? rating;
  @override
  final int? stock;
  @override
  final BuiltList<String>? productTags;
  @override
  final String? brand;
  @override
  final String? sku;
  @override
  final int? weight;
  @override
  final ProductDimensionsDto? productDimensions;
  @override
  final String? warrantyInformation;
  @override
  final String? shippingInformation;
  @override
  final String? availabilityStatus;
  @override
  final BuiltList<ProductReviewsDto>? productReviews;
  @override
  final String? returnPolicy;
  @override
  final int? minimumOrderQuantity;
  @override
  final ProductMetaDto? productMeta;
  @override
  final String? thumbnail;
  @override
  final BuiltList<String>? productImages;

  factory _$ProductsDetailsResponse(
          [void Function(ProductsDetailsResponseBuilder)? updates]) =>
      (new ProductsDetailsResponseBuilder()..update(updates))._build();

  _$ProductsDetailsResponse._(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.productTags,
      this.brand,
      this.sku,
      this.weight,
      this.productDimensions,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.productReviews,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.productMeta,
      this.thumbnail,
      this.productImages})
      : super._();

  @override
  ProductsDetailsResponse rebuild(
          void Function(ProductsDetailsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsDetailsResponseBuilder toBuilder() =>
      new ProductsDetailsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsDetailsResponse &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        category == other.category &&
        price == other.price &&
        discountPercentage == other.discountPercentage &&
        rating == other.rating &&
        stock == other.stock &&
        productTags == other.productTags &&
        brand == other.brand &&
        sku == other.sku &&
        weight == other.weight &&
        productDimensions == other.productDimensions &&
        warrantyInformation == other.warrantyInformation &&
        shippingInformation == other.shippingInformation &&
        availabilityStatus == other.availabilityStatus &&
        productReviews == other.productReviews &&
        returnPolicy == other.returnPolicy &&
        minimumOrderQuantity == other.minimumOrderQuantity &&
        productMeta == other.productMeta &&
        thumbnail == other.thumbnail &&
        productImages == other.productImages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, discountPercentage.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, stock.hashCode);
    _$hash = $jc(_$hash, productTags.hashCode);
    _$hash = $jc(_$hash, brand.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, productDimensions.hashCode);
    _$hash = $jc(_$hash, warrantyInformation.hashCode);
    _$hash = $jc(_$hash, shippingInformation.hashCode);
    _$hash = $jc(_$hash, availabilityStatus.hashCode);
    _$hash = $jc(_$hash, productReviews.hashCode);
    _$hash = $jc(_$hash, returnPolicy.hashCode);
    _$hash = $jc(_$hash, minimumOrderQuantity.hashCode);
    _$hash = $jc(_$hash, productMeta.hashCode);
    _$hash = $jc(_$hash, thumbnail.hashCode);
    _$hash = $jc(_$hash, productImages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsDetailsResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('category', category)
          ..add('price', price)
          ..add('discountPercentage', discountPercentage)
          ..add('rating', rating)
          ..add('stock', stock)
          ..add('productTags', productTags)
          ..add('brand', brand)
          ..add('sku', sku)
          ..add('weight', weight)
          ..add('productDimensions', productDimensions)
          ..add('warrantyInformation', warrantyInformation)
          ..add('shippingInformation', shippingInformation)
          ..add('availabilityStatus', availabilityStatus)
          ..add('productReviews', productReviews)
          ..add('returnPolicy', returnPolicy)
          ..add('minimumOrderQuantity', minimumOrderQuantity)
          ..add('productMeta', productMeta)
          ..add('thumbnail', thumbnail)
          ..add('productImages', productImages))
        .toString();
  }
}

class ProductsDetailsResponseBuilder
    implements
        Builder<ProductsDetailsResponse, ProductsDetailsResponseBuilder> {
  _$ProductsDetailsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _discountPercentage;
  double? get discountPercentage => _$this._discountPercentage;
  set discountPercentage(double? discountPercentage) =>
      _$this._discountPercentage = discountPercentage;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  int? _stock;
  int? get stock => _$this._stock;
  set stock(int? stock) => _$this._stock = stock;

  ListBuilder<String>? _productTags;
  ListBuilder<String> get productTags =>
      _$this._productTags ??= new ListBuilder<String>();
  set productTags(ListBuilder<String>? productTags) =>
      _$this._productTags = productTags;

  String? _brand;
  String? get brand => _$this._brand;
  set brand(String? brand) => _$this._brand = brand;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  int? _weight;
  int? get weight => _$this._weight;
  set weight(int? weight) => _$this._weight = weight;

  ProductDimensionsDtoBuilder? _productDimensions;
  ProductDimensionsDtoBuilder get productDimensions =>
      _$this._productDimensions ??= new ProductDimensionsDtoBuilder();
  set productDimensions(ProductDimensionsDtoBuilder? productDimensions) =>
      _$this._productDimensions = productDimensions;

  String? _warrantyInformation;
  String? get warrantyInformation => _$this._warrantyInformation;
  set warrantyInformation(String? warrantyInformation) =>
      _$this._warrantyInformation = warrantyInformation;

  String? _shippingInformation;
  String? get shippingInformation => _$this._shippingInformation;
  set shippingInformation(String? shippingInformation) =>
      _$this._shippingInformation = shippingInformation;

  String? _availabilityStatus;
  String? get availabilityStatus => _$this._availabilityStatus;
  set availabilityStatus(String? availabilityStatus) =>
      _$this._availabilityStatus = availabilityStatus;

  ListBuilder<ProductReviewsDto>? _productReviews;
  ListBuilder<ProductReviewsDto> get productReviews =>
      _$this._productReviews ??= new ListBuilder<ProductReviewsDto>();
  set productReviews(ListBuilder<ProductReviewsDto>? productReviews) =>
      _$this._productReviews = productReviews;

  String? _returnPolicy;
  String? get returnPolicy => _$this._returnPolicy;
  set returnPolicy(String? returnPolicy) => _$this._returnPolicy = returnPolicy;

  int? _minimumOrderQuantity;
  int? get minimumOrderQuantity => _$this._minimumOrderQuantity;
  set minimumOrderQuantity(int? minimumOrderQuantity) =>
      _$this._minimumOrderQuantity = minimumOrderQuantity;

  ProductMetaDtoBuilder? _productMeta;
  ProductMetaDtoBuilder get productMeta =>
      _$this._productMeta ??= new ProductMetaDtoBuilder();
  set productMeta(ProductMetaDtoBuilder? productMeta) =>
      _$this._productMeta = productMeta;

  String? _thumbnail;
  String? get thumbnail => _$this._thumbnail;
  set thumbnail(String? thumbnail) => _$this._thumbnail = thumbnail;

  ListBuilder<String>? _productImages;
  ListBuilder<String> get productImages =>
      _$this._productImages ??= new ListBuilder<String>();
  set productImages(ListBuilder<String>? productImages) =>
      _$this._productImages = productImages;

  ProductsDetailsResponseBuilder();

  ProductsDetailsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _category = $v.category;
      _price = $v.price;
      _discountPercentage = $v.discountPercentage;
      _rating = $v.rating;
      _stock = $v.stock;
      _productTags = $v.productTags?.toBuilder();
      _brand = $v.brand;
      _sku = $v.sku;
      _weight = $v.weight;
      _productDimensions = $v.productDimensions?.toBuilder();
      _warrantyInformation = $v.warrantyInformation;
      _shippingInformation = $v.shippingInformation;
      _availabilityStatus = $v.availabilityStatus;
      _productReviews = $v.productReviews?.toBuilder();
      _returnPolicy = $v.returnPolicy;
      _minimumOrderQuantity = $v.minimumOrderQuantity;
      _productMeta = $v.productMeta?.toBuilder();
      _thumbnail = $v.thumbnail;
      _productImages = $v.productImages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsDetailsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsDetailsResponse;
  }

  @override
  void update(void Function(ProductsDetailsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductsDetailsResponse build() => _build();

  _$ProductsDetailsResponse _build() {
    _$ProductsDetailsResponse _$result;
    try {
      _$result = _$v ??
          new _$ProductsDetailsResponse._(
            id: id,
            title: title,
            description: description,
            category: category,
            price: price,
            discountPercentage: discountPercentage,
            rating: rating,
            stock: stock,
            productTags: _productTags?.build(),
            brand: brand,
            sku: sku,
            weight: weight,
            productDimensions: _productDimensions?.build(),
            warrantyInformation: warrantyInformation,
            shippingInformation: shippingInformation,
            availabilityStatus: availabilityStatus,
            productReviews: _productReviews?.build(),
            returnPolicy: returnPolicy,
            minimumOrderQuantity: minimumOrderQuantity,
            productMeta: _productMeta?.build(),
            thumbnail: thumbnail,
            productImages: _productImages?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'productTags';
        _productTags?.build();

        _$failedField = 'productDimensions';
        _productDimensions?.build();

        _$failedField = 'productReviews';
        _productReviews?.build();

        _$failedField = 'productMeta';
        _productMeta?.build();

        _$failedField = 'productImages';
        _productImages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductsDetailsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProductDimensionsDto extends ProductDimensionsDto {
  @override
  final double? width;
  @override
  final double? height;
  @override
  final double? depth;

  factory _$ProductDimensionsDto(
          [void Function(ProductDimensionsDtoBuilder)? updates]) =>
      (new ProductDimensionsDtoBuilder()..update(updates))._build();

  _$ProductDimensionsDto._({this.width, this.height, this.depth}) : super._();

  @override
  ProductDimensionsDto rebuild(
          void Function(ProductDimensionsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductDimensionsDtoBuilder toBuilder() =>
      new ProductDimensionsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductDimensionsDto &&
        width == other.width &&
        height == other.height &&
        depth == other.depth;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, depth.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductDimensionsDto')
          ..add('width', width)
          ..add('height', height)
          ..add('depth', depth))
        .toString();
  }
}

class ProductDimensionsDtoBuilder
    implements Builder<ProductDimensionsDto, ProductDimensionsDtoBuilder> {
  _$ProductDimensionsDto? _$v;

  double? _width;
  double? get width => _$this._width;
  set width(double? width) => _$this._width = width;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  double? _depth;
  double? get depth => _$this._depth;
  set depth(double? depth) => _$this._depth = depth;

  ProductDimensionsDtoBuilder();

  ProductDimensionsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _width = $v.width;
      _height = $v.height;
      _depth = $v.depth;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductDimensionsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductDimensionsDto;
  }

  @override
  void update(void Function(ProductDimensionsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductDimensionsDto build() => _build();

  _$ProductDimensionsDto _build() {
    final _$result = _$v ??
        new _$ProductDimensionsDto._(
          width: width,
          height: height,
          depth: depth,
        );
    replace(_$result);
    return _$result;
  }
}

class _$ProductReviewsDto extends ProductReviewsDto {
  @override
  final int? rating;
  @override
  final String? comment;
  @override
  final String? date;
  @override
  final String? reviewerName;
  @override
  final String? reviewerEmail;

  factory _$ProductReviewsDto(
          [void Function(ProductReviewsDtoBuilder)? updates]) =>
      (new ProductReviewsDtoBuilder()..update(updates))._build();

  _$ProductReviewsDto._(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail})
      : super._();

  @override
  ProductReviewsDto rebuild(void Function(ProductReviewsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductReviewsDtoBuilder toBuilder() =>
      new ProductReviewsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductReviewsDto &&
        rating == other.rating &&
        comment == other.comment &&
        date == other.date &&
        reviewerName == other.reviewerName &&
        reviewerEmail == other.reviewerEmail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, reviewerName.hashCode);
    _$hash = $jc(_$hash, reviewerEmail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductReviewsDto')
          ..add('rating', rating)
          ..add('comment', comment)
          ..add('date', date)
          ..add('reviewerName', reviewerName)
          ..add('reviewerEmail', reviewerEmail))
        .toString();
  }
}

class ProductReviewsDtoBuilder
    implements Builder<ProductReviewsDto, ProductReviewsDtoBuilder> {
  _$ProductReviewsDto? _$v;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _reviewerName;
  String? get reviewerName => _$this._reviewerName;
  set reviewerName(String? reviewerName) => _$this._reviewerName = reviewerName;

  String? _reviewerEmail;
  String? get reviewerEmail => _$this._reviewerEmail;
  set reviewerEmail(String? reviewerEmail) =>
      _$this._reviewerEmail = reviewerEmail;

  ProductReviewsDtoBuilder();

  ProductReviewsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rating = $v.rating;
      _comment = $v.comment;
      _date = $v.date;
      _reviewerName = $v.reviewerName;
      _reviewerEmail = $v.reviewerEmail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductReviewsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductReviewsDto;
  }

  @override
  void update(void Function(ProductReviewsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductReviewsDto build() => _build();

  _$ProductReviewsDto _build() {
    final _$result = _$v ??
        new _$ProductReviewsDto._(
          rating: rating,
          comment: comment,
          date: date,
          reviewerName: reviewerName,
          reviewerEmail: reviewerEmail,
        );
    replace(_$result);
    return _$result;
  }
}

class _$ProductMetaDto extends ProductMetaDto {
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? barcode;
  @override
  final String? qrCode;

  factory _$ProductMetaDto([void Function(ProductMetaDtoBuilder)? updates]) =>
      (new ProductMetaDtoBuilder()..update(updates))._build();

  _$ProductMetaDto._(
      {this.createdAt, this.updatedAt, this.barcode, this.qrCode})
      : super._();

  @override
  ProductMetaDto rebuild(void Function(ProductMetaDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductMetaDtoBuilder toBuilder() =>
      new ProductMetaDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductMetaDto &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        barcode == other.barcode &&
        qrCode == other.qrCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, barcode.hashCode);
    _$hash = $jc(_$hash, qrCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductMetaDto')
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('barcode', barcode)
          ..add('qrCode', qrCode))
        .toString();
  }
}

class ProductMetaDtoBuilder
    implements Builder<ProductMetaDto, ProductMetaDtoBuilder> {
  _$ProductMetaDto? _$v;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _barcode;
  String? get barcode => _$this._barcode;
  set barcode(String? barcode) => _$this._barcode = barcode;

  String? _qrCode;
  String? get qrCode => _$this._qrCode;
  set qrCode(String? qrCode) => _$this._qrCode = qrCode;

  ProductMetaDtoBuilder();

  ProductMetaDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _barcode = $v.barcode;
      _qrCode = $v.qrCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductMetaDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductMetaDto;
  }

  @override
  void update(void Function(ProductMetaDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductMetaDto build() => _build();

  _$ProductMetaDto _build() {
    final _$result = _$v ??
        new _$ProductMetaDto._(
          createdAt: createdAt,
          updatedAt: updatedAt,
          barcode: barcode,
          qrCode: qrCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
