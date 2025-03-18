import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutterbaseproject/businessUtils/navigationService/NavigationService.dart';
import 'package:flutterbaseproject/businessUtils/toast/ToastUtil.dart';
import '../../../businessUtils/constants/constants.dart';
import '../../models/newloginresponse/login_resp.dart';
import '../../models/product_details_response/products_details_response.dart';
import '../../models/productsResponse/products_response.dart';
import 'built_value_converter.dart';
part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(AppStrings.baseUrl),
      interceptors: [authHeaderInterceptor,
        HttpLoggingInterceptor(),
      responseInterceptor, // Add Response Interceptor
       ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      services: [_$ApiService()],
    );

    return _$ApiService(client);
  }
  static Future<Request> authHeaderInterceptor(Request request) async {
    // Check network connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      ToastUtil.showToast(AppStrings.noInternetMessage);
      throw Exception("No internet connection");
    }

    // Add headers
    var headers = Map<String, String>.from(request.headers);
    request = request.copyWith(headers: headers);
    return request;
  }
  static Response responseInterceptor(Response response) {
    switch (response.statusCode) {
      case 401:
        ToastUtil.showToast("Unauthorized! Logging out...");
        // Handle logout logic (like clearing tokens & redirecting to login)
        NavigationService.navigateAndReplace('/login');
        break;

      case 402:
        ToastUtil.showToast("Payment Required!");
        break;

      case 403:
        ToastUtil.showToast("Forbidden!");
        break;

      case 404:
        ToastUtil.showToast("Resource not found!");
        break;

      case 500:
        ToastUtil.showToast("Server Error! Please try again later.");
        break;

      default:
        if (response.statusCode != 200) {
          ToastUtil.showToast("Error: ${response.statusCode}");
        }
        break;
    }
    return response;
  }


  @Get(path: 'products')
  Future<Response<ProductsResponse>> getProducts();

  @Get(path: 'products/{id}')
  Future<Response<ProductsDetailsResponse>> getProductDetails(
    @Path() String id,
  );

  @Post(path: 'auth/login')
  Future<Response<LoginResp>> login(
    @Body() Map<String, dynamic> body,
  );
}
