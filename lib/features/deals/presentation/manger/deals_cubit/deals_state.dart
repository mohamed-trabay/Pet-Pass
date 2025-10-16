part of 'deals_cubit.dart';

sealed class DealsState extends Equatable {
  const DealsState();

  @override
  List<Object> get props => [];
}

final class DealsInitial extends DealsState {}

final class FilteredProductsLoading extends DealsState {}

final class FilteredProductsFailure extends DealsState {
  final String errMessage;

  const FilteredProductsFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

final class FilteredProductsSuccess extends DealsState {
  final List<OfferModel> products;

  const FilteredProductsSuccess(this.products);

  @override
  List<Object> get props => [products];
}
