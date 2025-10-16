import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/core/utiles/service_locator.dart';
import 'package:pet_pass/features/home/data/repos/home.repo.impl.dart';
import 'package:pet_pass/features/home/presentation/manger/newest_product_cubit/cubit/newest_product_cubit.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  NewestProductCubit(getIt.get<HomeRepoImpl>())
                    ..fetchNewestProduct(),
        ),
      ],
      child: const SafeArea(child: Scaffold(body: HomeViewBody())),
    );
  }
}
