part of 'newest_product_cubit.dart';

sealed class NewestProductState extends Equatable {
  const NewestProductState();

  @override
  List<Object> get props => [];
}

final class NewestProductInitial extends NewestProductState {}

final class NewestProductLoading extends NewestProductState {}

final class NewestProductFailire extends NewestProductState {
  final String errMessage;

  const NewestProductFailire({required this.errMessage});
}

final class NewestProductSuccess extends NewestProductState {
  final List<OfferModel> products;

  const NewestProductSuccess({required this.products});
}
