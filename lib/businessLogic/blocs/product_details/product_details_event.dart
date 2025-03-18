part of 'product_details_bloc.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();
  @override
  List<Object> get props => [];
}

class GetProductsDetail extends ProductDetailsEvent {
  final String productId;
  GetProductsDetail(this.productId);
}

