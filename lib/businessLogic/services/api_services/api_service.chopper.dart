// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiService;

  @override
  Future<Response<ProductsResponse>> getProducts() {
    final Uri $url = Uri.parse('products');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ProductsResponse, ProductsResponse>($request);
  }

  @override
  Future<Response<ProductsDetailsResponse>> getProductDetails(String id) {
    final Uri $url = Uri.parse('products/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ProductsDetailsResponse, ProductsDetailsResponse>($request);
  }

  @override
  Future<Response<LoginResp>> login(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('auth/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginResp, LoginResp>($request);
  }
}
