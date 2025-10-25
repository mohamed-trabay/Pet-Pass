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
  int _currentPage = 1;
  final int _perPage = 6;
  List<OfferModel> _allProducts = [];
  bool _hasMore = true;

  DealsCubit(this.dealsRepo) : super(DealsInitial());

  Future<void> fetchAllProducts({bool loadMore = false}) async {
    if (isClosed) return;

    if (!loadMore) {
      selectedCategoryId = null;
      _currentPage = 1;
      _allProducts = [];
      _hasMore = true;
      emit(FilteredProductsLoading());
    } else {
      if (!_hasMore) return;
      emit(FilteredProductsLoadingMore(_allProducts));
      _currentPage++;
    }

    Either<Failure, List<OfferModel>> result = await dealsRepo.fetchAllProducts(
      page: _currentPage,
      perPage: _perPage,
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        if (loadMore) {
          _currentPage--;
          emit(FilteredProductsSuccess(_allProducts, hasMore: _hasMore));
        } else {
          emit(FilteredProductsFailure(failure.errMessage));
        }
      },
      (products) {
        _hasMore = products.isNotEmpty;
        _allProducts.addAll(products);
        emit(FilteredProductsSuccess(_allProducts, hasMore: _hasMore));
      },
    );
  }

  Future<void> fetchProductsByCategory(
    int categoryId, {
    bool loadMore = false,
  }) async {
    if (isClosed) return;

    if (!loadMore) {
      // Reset pagination
      selectedCategoryId = categoryId;
      _currentPage = 1;
      _allProducts = [];
      _hasMore = true;
      emit(FilteredProductsLoading());
    } else {
      if (!_hasMore || selectedCategoryId != categoryId) return;
      emit(FilteredProductsLoadingMore(_allProducts));
      _currentPage++;
    }

    Either<Failure, List<OfferModel>> result = await dealsRepo
        .fetchProductsByCategory(
          categoryId,
          page: _currentPage,
          perPage: _perPage,
        );

    if (isClosed) return;

    result.fold(
      (failure) {
        if (loadMore) {
          _currentPage--;
          emit(FilteredProductsSuccess(_allProducts, hasMore: _hasMore));
        } else {
          emit(FilteredProductsFailure(failure.errMessage));
        }
      },
      (products) {
        _hasMore = products.isNotEmpty;
        _allProducts.addAll(products);
        emit(FilteredProductsSuccess(_allProducts, hasMore: _hasMore));
      },
    );
  }

  bool isSelected(int? categoryId) {
    return selectedCategoryId == categoryId;
  }
}
