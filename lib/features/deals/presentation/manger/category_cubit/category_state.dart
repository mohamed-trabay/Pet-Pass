part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoriesLoading extends CategoryState {}

final class CategoriesFailire extends CategoryState {
  final String errMessage;

  const CategoriesFailire({required this.errMessage});
}

final class CategoriesSuccess extends CategoryState {
  final List<CategoryModel> categories;

  const CategoriesSuccess({required this.categories});
}
