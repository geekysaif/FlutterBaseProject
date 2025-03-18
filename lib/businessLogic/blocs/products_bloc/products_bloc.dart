import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterbaseproject/businessLogic/models/productsResponse/products_response.dart';
import 'package:flutterbaseproject/businessUtils/sharedPreference/SharedPreferencesManager.dart';

import '../../repo/app_repo.dart';

part 'products_event.dart';
part 'products_state.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final AppRepo appRepo;
  final SharedPreferencesManager sharedPrefs;
  ProductsBloc(this.appRepo, this.sharedPrefs) : super(ProductsInitial()) {
    on<GetProducts>((event, emit) async {
      try{
        emit(ProductsLoading());
        final resp = await appRepo.getProducts();
        if(resp.statusCode == 200 && resp.body?.products != null) {
          emit(ProductsSuccess(resp.body?.products!.asList()??[]));
        } else {
          emit( ProductsFail("Error"));
        }
      }catch(e) {
        emit(ProductsError("$e"));
      }
    });
  }
}
