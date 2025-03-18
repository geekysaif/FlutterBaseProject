import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterbaseproject/businessLogic/repo/app_repo.dart';
import 'package:flutterbaseproject/businessUtils/sharedPreference/SharedPreferencesManager.dart';

import '../../models/product_details_response/products_details_response.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final AppRepo appRepo;
  final SharedPreferencesManager sharedPrefs;
  ProductDetailsBloc(this.appRepo, this.sharedPrefs) : super(ProductDetailsInitial()) {
    on<GetProductsDetail>((event, emit) async {
      try{
        emit(ProductDetailsLoading());
        final resp = await appRepo.getProductsDetails(queryParams: event.productId);
        if(resp.statusCode == 200 && resp.body != null) {
          emit(ProductDetailsSuccess(resp.body!));
        } else {
          emit( ProductDetailsFail("Error"));
        }
      }catch(e) {
        emit(ProductDetailsError("$e"));
      }
    });
  }
}
