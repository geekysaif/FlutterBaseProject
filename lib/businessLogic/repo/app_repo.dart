import 'package:chopper/chopper.dart';

import 'package:flutterbaseproject/businessLogic/services/api_services/api_service.dart';
import '../models/newloginresponse/login_resp.dart';
import '../models/product_details_response/products_details_response.dart';
import '../models/productsResponse/products_response.dart';

class AppRepo{
  ApiService apiService;

  AppRepo(this.apiService);

  Future<Response<ProductsResponse>> getProducts() async {
    return apiService.getProducts();
  }

  Future<Response<ProductsDetailsResponse>> getProductsDetails({String? queryParams}) async {
    try {
      if (queryParams != null && queryParams.isNotEmpty) {
        print('Query Parameters: $queryParams'); // Debugging query parameters
      }

      // Pass queryParams directly to getProductDetails
      return  apiService.getProductDetails(queryParams!);
    } catch (e) {
      // Handle errors gracefully
      print('Error fetching product details: $e');
      rethrow;
    }
  }



  Future<Response<LoginResp>> login(Map<String,dynamic> body) async {
    return apiService.login(body);
  }
}

