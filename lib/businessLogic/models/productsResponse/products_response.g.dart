// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductsResponse> _$productsResponseSerializer =
    new _$ProductsResponseSerializer();
Serializer<ProductsDto> _$productsDtoSerializer = new _$ProductsDtoSerializer();
Serializer<DimensionsDto> _$dimensionsDtoSerializer =
    new _$DimensionsDtoSerializer();
Serializer<ReviewsDto> _$reviewsDtoSerializer = new _$ReviewsDtoSerializer();
Serializer<MetaDto> _$metaDtoSerializer = new _$MetaDtoSerializer();

class _$ProductsResponseSerializer
    implements StructuredSerializer<ProductsResponse> {
  @override
  final Iterable<Type> types = const [ProductsResponse, _$ProductsResponse];
  @override
  final String wireName = 'ProductsResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.products;
    if (value != null) {
      result
        ..add('products')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ProductsDto)])));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.skip;
    if (value != null) {
      result
        ..add('skip')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.limit;
    if (value != null) {
      result
        ..add('limit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ProductsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'products':
          result.products.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductsDto)]))!
              as BuiltList<Object?>);
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'skip':
          result.skip = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductsDtoSerializer implements StructuredSerializer<ProductsDto> {
  @override
  final Iterable<Type> types = const [ProductsDto, _$ProductsDto];
  @override
  final String wireName = 'ProductsDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductsDto object,
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
    value = object.tags;
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
    value = object.dimensions;
    if (value != null) {
      result
        ..add('dimensions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DimensionsDto)));
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
    value = object.reviews;
    if (value != null) {
      result
        ..add('reviews')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(ReviewsDto)])));
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
    value = object.meta;
    if (value != null) {
      result
        ..add('meta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(MetaDto)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.thumbnail;
    if (value != null) {
      result
        ..add('thumbnail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ProductsDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsDtoBuilder();

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
          result.tags.replace(serializers.deserialize(value,
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
          result.dimensions.replace(serializers.deserialize(value,
              specifiedType: const FullType(DimensionsDto))! as DimensionsDto);
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
          result.reviews.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ReviewsDto)]))!
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
          result.meta.replace(serializers.deserialize(value,
              specifiedType: const FullType(MetaDto))! as MetaDto);
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DimensionsDtoSerializer implements StructuredSerializer<DimensionsDto> {
  @override
  final Iterable<Type> types = const [DimensionsDto, _$DimensionsDto];
  @override
  final String wireName = 'DimensionsDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, DimensionsDto object,
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
  DimensionsDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DimensionsDtoBuilder();

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

class _$ReviewsDtoSerializer implements StructuredSerializer<ReviewsDto> {
  @override
  final Iterable<Type> types = const [ReviewsDto, _$ReviewsDto];
  @override
  final String wireName = 'ReviewsDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReviewsDto object,
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
  ReviewsDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReviewsDtoBuilder();

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

class _$MetaDtoSerializer implements StructuredSerializer<MetaDto> {
  @override
  final Iterable<Type> types = const [MetaDto, _$MetaDto];
  @override
  final String wireName = 'MetaDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, MetaDto object,
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
  MetaDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MetaDtoBuilder();

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

class _$ProductsResponse extends ProductsResponse {
  @override
  final BuiltList<ProductsDto>? products;
  @override
  final int? total;
  @override
  final int? skip;
  @override
  final int? limit;

  factory _$ProductsResponse(
          [void Function(ProductsResponseBuilder)? updates]) =>
      (new ProductsResponseBuilder()..update(updates))._build();

  _$ProductsResponse._({this.products, this.total, this.skip, this.limit})
      : super._();

  @override
  ProductsResponse rebuild(void Function(ProductsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsResponseBuilder toBuilder() =>
      new ProductsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsResponse &&
        products == other.products &&
        total == other.total &&
        skip == other.skip &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, skip.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsResponse')
          ..add('products', products)
          ..add('total', total)
          ..add('skip', skip)
          ..add('limit', limit))
        .toString();
  }
}

class ProductsResponseBuilder
    implements Builder<ProductsResponse, ProductsResponseBuilder> {
  _$ProductsResponse? _$v;

  ListBuilder<ProductsDto>? _products;
  ListBuilder<ProductsDto> get products =>
      _$this._products ??= new ListBuilder<ProductsDto>();
  set products(ListBuilder<ProductsDto>? products) =>
      _$this._products = products;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _skip;
  int? get skip => _$this._skip;
  set skip(int? skip) => _$this._skip = skip;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  ProductsResponseBuilder();

  ProductsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _products = $v.products?.toBuilder();
      _total = $v.total;
      _skip = $v.skip;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsResponse;
  }

  @override
  void update(void Function(ProductsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductsResponse build() => _build();

  _$ProductsResponse _build() {
    _$ProductsResponse _$result;
    try {
      _$result = _$v ??
          new _$ProductsResponse._(
            products: _products?.build(),
            total: total,
            skip: skip,
            limit: limit,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        _products?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProductsDto extends ProductsDto {
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
  final BuiltList<String>? tags;
  @override
  final String? brand;
  @override
  final String? sku;
  @override
  final int? weight;
  @override
  final DimensionsDto? dimensions;
  @override
  final String? warrantyInformation;
  @override
  final String? shippingInformation;
  @override
  final String? availabilityStatus;
  @override
  final BuiltList<ReviewsDto>? reviews;
  @override
  final String? returnPolicy;
  @override
  final int? minimumOrderQuantity;
  @override
  final MetaDto? meta;
  @override
  final BuiltList<String>? images;
  @override
  final String? thumbnail;

  factory _$ProductsDto([void Function(ProductsDtoBuilder)? updates]) =>
      (new ProductsDtoBuilder()..update(updates))._build();

  _$ProductsDto._(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.tags,
      this.brand,
      this.sku,
      this.weight,
      this.dimensions,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.reviews,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.meta,
      this.images,
      this.thumbnail})
      : super._();

  @override
  ProductsDto rebuild(void Function(ProductsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsDtoBuilder toBuilder() => new ProductsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsDto &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        category == other.category &&
        price == other.price &&
        discountPercentage == other.discountPercentage &&
        rating == other.rating &&
        stock == other.stock &&
        tags == other.tags &&
        brand == other.brand &&
        sku == other.sku &&
        weight == other.weight &&
        dimensions == other.dimensions &&
        warrantyInformation == other.warrantyInformation &&
        shippingInformation == other.shippingInformation &&
        availabilityStatus == other.availabilityStatus &&
        reviews == other.reviews &&
        returnPolicy == other.returnPolicy &&
        minimumOrderQuantity == other.minimumOrderQuantity &&
        meta == other.meta &&
        images == other.images &&
        thumbnail == other.thumbnail;
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
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, brand.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, dimensions.hashCode);
    _$hash = $jc(_$hash, warrantyInformation.hashCode);
    _$hash = $jc(_$hash, shippingInformation.hashCode);
    _$hash = $jc(_$hash, availabilityStatus.hashCode);
    _$hash = $jc(_$hash, reviews.hashCode);
    _$hash = $jc(_$hash, returnPolicy.hashCode);
    _$hash = $jc(_$hash, minimumOrderQuantity.hashCode);
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, thumbnail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsDto')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('category', category)
          ..add('price', price)
          ..add('discountPercentage', discountPercentage)
          ..add('rating', rating)
          ..add('stock', stock)
          ..add('tags', tags)
          ..add('brand', brand)
          ..add('sku', sku)
          ..add('weight', weight)
          ..add('dimensions', dimensions)
          ..add('warrantyInformation', warrantyInformation)
          ..add('shippingInformation', shippingInformation)
          ..add('availabilityStatus', availabilityStatus)
          ..add('reviews', reviews)
          ..add('returnPolicy', returnPolicy)
          ..add('minimumOrderQuantity', minimumOrderQuantity)
          ..add('meta', meta)
          ..add('images', images)
          ..add('thumbnail', thumbnail))
        .toString();
  }
}

class ProductsDtoBuilder implements Builder<ProductsDto, ProductsDtoBuilder> {
  _$ProductsDto? _$v;

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

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  String? _brand;
  String? get brand => _$this._brand;
  set brand(String? brand) => _$this._brand = brand;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  int? _weight;
  int? get weight => _$this._weight;
  set weight(int? weight) => _$this._weight = weight;

  DimensionsDtoBuilder? _dimensions;
  DimensionsDtoBuilder get dimensions =>
      _$this._dimensions ??= new DimensionsDtoBuilder();
  set dimensions(DimensionsDtoBuilder? dimensions) =>
      _$this._dimensions = dimensions;

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

  ListBuilder<ReviewsDto>? _reviews;
  ListBuilder<ReviewsDto> get reviews =>
      _$this._reviews ??= new ListBuilder<ReviewsDto>();
  set reviews(ListBuilder<ReviewsDto>? reviews) => _$this._reviews = reviews;

  String? _returnPolicy;
  String? get returnPolicy => _$this._returnPolicy;
  set returnPolicy(String? returnPolicy) => _$this._returnPolicy = returnPolicy;

  int? _minimumOrderQuantity;
  int? get minimumOrderQuantity => _$this._minimumOrderQuantity;
  set minimumOrderQuantity(int? minimumOrderQuantity) =>
      _$this._minimumOrderQuantity = minimumOrderQuantity;

  MetaDtoBuilder? _meta;
  MetaDtoBuilder get meta => _$this._meta ??= new MetaDtoBuilder();
  set meta(MetaDtoBuilder? meta) => _$this._meta = meta;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  String? _thumbnail;
  String? get thumbnail => _$this._thumbnail;
  set thumbnail(String? thumbnail) => _$this._thumbnail = thumbnail;

  ProductsDtoBuilder();

  ProductsDtoBuilder get _$this {
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
      _tags = $v.tags?.toBuilder();
      _brand = $v.brand;
      _sku = $v.sku;
      _weight = $v.weight;
      _dimensions = $v.dimensions?.toBuilder();
      _warrantyInformation = $v.warrantyInformation;
      _shippingInformation = $v.shippingInformation;
      _availabilityStatus = $v.availabilityStatus;
      _reviews = $v.reviews?.toBuilder();
      _returnPolicy = $v.returnPolicy;
      _minimumOrderQuantity = $v.minimumOrderQuantity;
      _meta = $v.meta?.toBuilder();
      _images = $v.images?.toBuilder();
      _thumbnail = $v.thumbnail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsDto;
  }

  @override
  void update(void Function(ProductsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductsDto build() => _build();

  _$ProductsDto _build() {
    _$ProductsDto _$result;
    try {
      _$result = _$v ??
          new _$ProductsDto._(
            id: id,
            title: title,
            description: description,
            category: category,
            price: price,
            discountPercentage: discountPercentage,
            rating: rating,
            stock: stock,
            tags: _tags?.build(),
            brand: brand,
            sku: sku,
            weight: weight,
            dimensions: _dimensions?.build(),
            warrantyInformation: warrantyInformation,
            shippingInformation: shippingInformation,
            availabilityStatus: availabilityStatus,
            reviews: _reviews?.build(),
            returnPolicy: returnPolicy,
            minimumOrderQuantity: minimumOrderQuantity,
            meta: _meta?.build(),
            images: _images?.build(),
            thumbnail: thumbnail,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();

        _$failedField = 'dimensions';
        _dimensions?.build();

        _$failedField = 'reviews';
        _reviews?.build();

        _$failedField = 'meta';
        _meta?.build();
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DimensionsDto extends DimensionsDto {
  @override
  final double? width;
  @override
  final double? height;
  @override
  final double? depth;

  factory _$DimensionsDto([void Function(DimensionsDtoBuilder)? updates]) =>
      (new DimensionsDtoBuilder()..update(updates))._build();

  _$DimensionsDto._({this.width, this.height, this.depth}) : super._();

  @override
  DimensionsDto rebuild(void Function(DimensionsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DimensionsDtoBuilder toBuilder() => new DimensionsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DimensionsDto &&
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
    return (newBuiltValueToStringHelper(r'DimensionsDto')
          ..add('width', width)
          ..add('height', height)
          ..add('depth', depth))
        .toString();
  }
}

class DimensionsDtoBuilder
    implements Builder<DimensionsDto, DimensionsDtoBuilder> {
  _$DimensionsDto? _$v;

  double? _width;
  double? get width => _$this._width;
  set width(double? width) => _$this._width = width;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  double? _depth;
  double? get depth => _$this._depth;
  set depth(double? depth) => _$this._depth = depth;

  DimensionsDtoBuilder();

  DimensionsDtoBuilder get _$this {
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
  void replace(DimensionsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DimensionsDto;
  }

  @override
  void update(void Function(DimensionsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DimensionsDto build() => _build();

  _$DimensionsDto _build() {
    final _$result = _$v ??
        new _$DimensionsDto._(
          width: width,
          height: height,
          depth: depth,
        );
    replace(_$result);
    return _$result;
  }
}

class _$ReviewsDto extends ReviewsDto {
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

  factory _$ReviewsDto([void Function(ReviewsDtoBuilder)? updates]) =>
      (new ReviewsDtoBuilder()..update(updates))._build();

  _$ReviewsDto._(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail})
      : super._();

  @override
  ReviewsDto rebuild(void Function(ReviewsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewsDtoBuilder toBuilder() => new ReviewsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewsDto &&
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
    return (newBuiltValueToStringHelper(r'ReviewsDto')
          ..add('rating', rating)
          ..add('comment', comment)
          ..add('date', date)
          ..add('reviewerName', reviewerName)
          ..add('reviewerEmail', reviewerEmail))
        .toString();
  }
}

class ReviewsDtoBuilder implements Builder<ReviewsDto, ReviewsDtoBuilder> {
  _$ReviewsDto? _$v;

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

  ReviewsDtoBuilder();

  ReviewsDtoBuilder get _$this {
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
  void replace(ReviewsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReviewsDto;
  }

  @override
  void update(void Function(ReviewsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewsDto build() => _build();

  _$ReviewsDto _build() {
    final _$result = _$v ??
        new _$ReviewsDto._(
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

class _$MetaDto extends MetaDto {
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? barcode;
  @override
  final String? qrCode;

  factory _$MetaDto([void Function(MetaDtoBuilder)? updates]) =>
      (new MetaDtoBuilder()..update(updates))._build();

  _$MetaDto._({this.createdAt, this.updatedAt, this.barcode, this.qrCode})
      : super._();

  @override
  MetaDto rebuild(void Function(MetaDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MetaDtoBuilder toBuilder() => new MetaDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MetaDto &&
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
    return (newBuiltValueToStringHelper(r'MetaDto')
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('barcode', barcode)
          ..add('qrCode', qrCode))
        .toString();
  }
}

class MetaDtoBuilder implements Builder<MetaDto, MetaDtoBuilder> {
  _$MetaDto? _$v;

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

  MetaDtoBuilder();

  MetaDtoBuilder get _$this {
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
  void replace(MetaDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MetaDto;
  }

  @override
  void update(void Function(MetaDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MetaDto build() => _build();

  _$MetaDto _build() {
    final _$result = _$v ??
        new _$MetaDto._(
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
