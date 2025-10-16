import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pet_pass/core/errors/failures.dart';
import 'package:pet_pass/core/utiles/api_service.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<OfferModel>>> fetchNewestProduct() async {
    try {
      var data = await apiService.get(
        endpoint: 'products',
        queryParams: {'per_page': 10},
      );

      List<OfferModel> products =
          data.map<OfferModel>((item) => OfferModel.fromJson(item)).toList();

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
