import 'package:dartz/dartz.dart';
import 'package:pet_pass/core/errors/failures.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<OfferModel>>> fetchNewestProduct();
}
