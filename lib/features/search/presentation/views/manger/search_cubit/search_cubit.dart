import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(SearchInitial());

  Future<void> search(String keyword) async {
    if (keyword.trim().isEmpty) {
      if (isClosed) return;
      emit(SearchInitial());
      return;
    }

    if (isClosed) return;
    emit(SearchLoading());

    try {
      final result = await searchRepo.searchProducts(keyword);

      if (isClosed) return;
      result.fold(
        (failure) => emit(SearchFailure(errMessage: failure.errMessage)),
        (products) => emit(SearchSuccess(products: products)),
      );
    } catch (e) {
      if (isClosed) return;
      emit(SearchFailure(errMessage: e.toString()));
    }
  }
}
