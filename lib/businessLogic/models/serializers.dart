import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutterbaseproject/businessLogic/models/product_details_response/products_details_response.dart';

import 'package:flutterbaseproject/businessLogic/models/productsResponse/products_response.dart';

import 'newloginresponse/login_resp.dart';

part 'serializers.g.dart';

@SerializersFor([
  LoginResp,
  ProductsResponse,
  ProductsDetailsResponse
])
final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();