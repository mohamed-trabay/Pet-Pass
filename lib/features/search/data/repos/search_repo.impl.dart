import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pet_pass/core/errors/failures.dart';
import 'package:pet_pass/core/services/api_service.dart';
import 'package:pet_pass/core/utiles/local_storage_service.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<OfferModel>>> searchProducts(
    String keyword,
  ) async {
    try {
      final languageCode = await LocalStorageService.loadLanguage();

      var data = await apiService.get(
        endpoint: 'products',
        queryParams: {'search': keyword, 'per_page': '8', 'lang': languageCode},
      );

      List<OfferModel> products =
          (data as List).map((item) => OfferModel.fromJson(item)).toList();

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
