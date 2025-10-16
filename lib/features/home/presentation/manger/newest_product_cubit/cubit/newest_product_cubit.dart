import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/home/data/repos/home_repo.dart';

part 'newest_product_state.dart';

class NewestProductCubit extends Cubit<NewestProductState> {
  final HomeRepo homeRepo;
  NewestProductCubit(this.homeRepo) : super(NewestProductInitial());

  Future<void> fetchNewestProduct() async {
    if (isClosed) return;

    emit(NewestProductLoading());

    try {
      final result = await homeRepo.fetchNewestProduct();
      if (isClosed) return;

      result.fold(
        (failure) => emit(NewestProductFailire(errMessage: failure.errMessage)),
        (products) => emit(NewestProductSuccess(products: products)),
      );
    } catch (e) {
      if (isClosed) return;
      emit(NewestProductFailire(errMessage: e.toString()));
    }
  }
}
