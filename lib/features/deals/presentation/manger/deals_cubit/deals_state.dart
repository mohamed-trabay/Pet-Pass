part of 'deals_cubit.dart';

abstract class DealsState extends Equatable {
  const DealsState();

  @override
  List<Object?> get props => [];
}

class DealsInitial extends DealsState {}

class FilteredProductsLoading extends DealsState {}

class FilteredProductsSuccess extends DealsState {
  final List<OfferModel> products;
  final bool hasMore;

  const FilteredProductsSuccess(this.products, {this.hasMore = true});

  @override
  List<Object?> get props => [products, hasMore];
}

class FilteredProductsFailure extends DealsState {
  final String errMessage;

  const FilteredProductsFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}

class FilteredProductsLoadingMore extends DealsState {
  final List<OfferModel> currentProducts;

  const FilteredProductsLoadingMore(this.currentProducts);

  @override
  List<Object?> get props => [currentProducts];
}
