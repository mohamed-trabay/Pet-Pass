import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/core/errors/failures.dart';
import 'package:pet_pass/features/deals/data/repo/deals_repo.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';

part 'deals_state.dart';

class DealsCubit extends Cubit<DealsState> {
  final DealsRepo dealsRepo;
  int? selectedCategoryId;

  DealsCubit(this.dealsRepo) : super(DealsInitial());

  Future<void> fetchAllProducts() async {
    if (isClosed) return;

    selectedCategoryId = null;
    emit(FilteredProductsLoading());

    Either<Failure, List<OfferModel>> result =
        await dealsRepo.fetchAllProducts();

    if (isClosed) return;

    result.fold(
      (failure) => emit(FilteredProductsFailure(failure.errMessage)),
      (products) => emit(FilteredProductsSuccess(products)),
    );
  }

  Future<void> fetchProductsByCategory(int categoryId) async {
    if (isClosed) return;

    selectedCategoryId = categoryId;
    emit(FilteredProductsLoading());

    Either<Failure, List<OfferModel>> result = await dealsRepo
        .fetchProductsByCategory(categoryId);

    if (isClosed) return;

    result.fold(
      (failure) => emit(FilteredProductsFailure(failure.errMessage)),
      (products) => emit(FilteredProductsSuccess(products)),
    );
  }

  bool isSelected(int? categoryId) {
    return selectedCategoryId == categoryId;
  }
}
