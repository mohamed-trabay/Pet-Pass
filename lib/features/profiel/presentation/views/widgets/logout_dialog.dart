import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:pet_pass/features/fav/presentation/manger/fav_cubit/fav_cubit.dart';

void showLogoutDialog(BuildContext context) {
  final lang = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(lang.logout),
          content: const Text('are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);

                context.read<AuthCubit>().logout();
                context.read<FavCubit>().clearFavorites();

                // ignore: use_build_context_synchronously
                GoRouter.of(context).pushReplacement(AppRouter.ksignInView);
              },
              child: const Text('confirm', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
  );
}
