import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/fav/presentation/manger/fav_cubit/fav_cubit.dart';

class FavIcon extends StatelessWidget {
  final OfferModel product;
  const FavIcon({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        bool isFav = false;
        if (state is FavoritesSuccess) {
          isFav = state.favorites.any((p) => p.id == product.id);
        }

        return Container(
          height: 36.h,
          decoration: BoxDecoration(
            color: AppColors.background(context),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                if (isFav) {
                  context.read<FavCubit>().removeFavorite(product);
                } else {
                  context.read<FavCubit>().addFavorite(product);
                }
              },
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border_outlined,
                color: isFav ? Colors.red : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
