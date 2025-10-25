import 'package:dartz/dartz.dart';
import 'package:pet_pass/core/errors/failures.dart';
import 'package:pet_pass/features/home/data/models/category_model.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';

abstract class DealsRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchCategories();
  Future<Either<Failure, List<OfferModel>>> fetchProductsByCategory(
    int categoryId, {
    int page = 1,
    int perPage = 6,
  });
  Future<Either<Failure, List<OfferModel>>> fetchAllProducts({
    int page = 1,
    int perPage = 6,
  });
}
