import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/features/deals/data/repo/deals_repo.dart';
import 'package:pet_pass/features/home/data/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final DealsRepo dealsRepo;
  CategoryCubit(this.dealsRepo) : super(CategoryInitial());
  Future<void> fetchCategories() async {
    if (isClosed) return;

    emit(CategoriesLoading());

    try {
      final result = await dealsRepo.fetchCategories();

      if (isClosed) return;

      result.fold(
        (failure) => emit(CategoriesFailire(errMessage: failure.errMessage)),
        (categories) => emit(CategoriesSuccess(categories: categories)),
      );
    } catch (e) {
      if (isClosed) return;
      emit(CategoriesFailire(errMessage: e.toString()));
    }
  }
}
