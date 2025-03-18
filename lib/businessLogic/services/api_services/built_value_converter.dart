import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';

import '../../models/serializers.dart';

final jsonSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

class BuiltValueConverter extends JsonConverter {
  T? _deserialize<T>(dynamic value) => jsonSerializers.deserializeWith<T>(
      jsonSerializers.serializerForType(T) as dynamic, value);

  // {
  //   // final serializer = jsonSerializers.serializerForType(T) as Serializer<T>?;
  //   // if (serializer == null) {
  //   //   throw Exception('No serializer for type $T');
  //   // }

  //   return jsonSerializers.deserializeWith<T>(jsonSerializers.);
  // }

  BuiltList<T> _deserializeListOf<T>(Iterable value) => BuiltList(
        value.map((value) => _deserialize<T>(value)).toList(growable: false),
      );

  dynamic _decode<T>(dynamic entity) {
    /// handle case when we want to access to Map<String, dynamic> directly
    /// getResource or getMapResource
    /// Avoid dynamic or unconverted value, this could lead to several issues
    if (entity is T) return entity;

    try {
      return entity is List
          ? _deserializeListOf<T>(entity)
          : _deserialize<T>(entity);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<Response<ResultType>> convertResponse<ResultType, Item>(
    Response response,
  ) async {
    // use [JsonConverter] to decode json
    //log(response.toString());
    final Response jsonRes = await super.convertResponse(response);
    final body = _decode<Item>(jsonRes.body);

    return jsonRes.copyWith<ResultType>(body: body);
  }
}
