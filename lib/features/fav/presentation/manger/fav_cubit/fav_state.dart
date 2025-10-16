part of 'fav_cubit.dart';

sealed class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

final class FavInitial extends FavState {}

class FavoritesLoading extends FavState {}

class FavoritesSuccess extends FavState {
  final List<OfferModel> favorites;
  const FavoritesSuccess(this.favorites);

  @override
  List<Object> get props => [favorites];
}

class FavoritesError extends FavState {
  final String message;
  const FavoritesError(this.message);

  @override
  List<Object> get props => [message];
}
