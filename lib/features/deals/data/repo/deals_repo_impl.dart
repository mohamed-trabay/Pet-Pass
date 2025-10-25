import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pet_pass/core/errors/failures.dart';
import 'package:pet_pass/core/services/api_service.dart';
import 'package:pet_pass/features/home/data/models/category_model.dart';
import 'package:pet_pass/features/deals/data/repo/deals_repo.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';

class DealsRepoImpl implements DealsRepo {
  final ApiService apiService;
  DealsRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      var data = await apiService.get(endpoint: 'products/categories');

      List<CategoryModel> categories = [];
      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OfferModel>>> fetchProductsByCategory(
    int categoryId, {
    int page = 1,
    int perPage = 6,
  }) async {
    try {
      var data = await apiService.get(
        endpoint: 'products',
        queryParams: {
          'category': categoryId,
          'page': page,
          'per_page': perPage,
        },
      );

      List<OfferModel> products = [];
      for (var item in data) {
        products.add(OfferModel.fromJson(item));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OfferModel>>> fetchAllProducts({
    int page = 1,
    int perPage = 6,
  }) async {
    try {
      var data = await apiService.get(
        endpoint: 'products',
        queryParams: {'page': page, 'per_page': perPage},
      );

      List<OfferModel> products = [];
      for (var item in data) {
        products.add(OfferModel.fromJson(item));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
