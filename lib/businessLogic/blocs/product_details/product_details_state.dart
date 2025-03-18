part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {
}

class ProductDetailsLoading extends ProductDetailsState {}
class ProductDetailsSuccess extends ProductDetailsState {
  final ProductsDetailsResponse response;

  const ProductDetailsSuccess(this.response);
}
class ProductDetailsFail extends ProductDetailsState {
  final String error;
  const ProductDetailsFail(this.error);
}
class ProductDetailsError extends ProductDetailsState {
  final String error;

  const ProductDetailsError(this.error);
}
