part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();
  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {

}

class ProductsLoading extends ProductsState {}
class ProductsSuccess extends ProductsState {
  final List<ProductsDto> response;

  const ProductsSuccess(this.response);
}
class ProductsFail extends ProductsState {
  final String error;
  const ProductsFail(this.error);
}
class ProductsError extends ProductsState {
  final String error;

  const ProductsError(this.error);
}

