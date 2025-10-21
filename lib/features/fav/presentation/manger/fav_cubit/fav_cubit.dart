import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/core/utiles/local_storage_service.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    try {
      final favs = await LocalStorageService.loadFavorites();
      emit(FavoritesSuccess(favs));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  Future<void> addFavorite(OfferModel product) async {
    if (state is FavoritesSuccess) {
      final current = (state as FavoritesSuccess).favorites;
      final updated = [...current, product];
      await LocalStorageService.saveFavorites(updated);
      emit(FavoritesSuccess(updated));
    } else {
      await LocalStorageService.saveFavorites([product]);
      emit(FavoritesSuccess([product]));
    }
  }

  Future<void> removeFavorite(OfferModel product) async {
    if (state is FavoritesSuccess) {
      final current = (state as FavoritesSuccess).favorites;
      final updated = current.where((p) => p.id != product.id).toList();
      await LocalStorageService.saveFavorites(updated);
      emit(FavoritesSuccess(updated));
    }
  }

  bool isFavorite(OfferModel product) {
    if (state is FavoritesSuccess) {
      return (state as FavoritesSuccess).favorites.any(
        (p) => p.id == product.id,
      );
    }
    return false;
  }

  Future<void> clearFavorites() async {
    await LocalStorageService.saveFavorites([]);
    emit(const FavoritesSuccess([]));
  }
}
