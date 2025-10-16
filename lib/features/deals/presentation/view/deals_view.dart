import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/core/utiles/service_locator.dart';
import 'package:pet_pass/features/deals/data/repo/deals_repo_impl.dart';
import 'package:pet_pass/features/deals/presentation/manger/category_cubit/category_cubit.dart';
import 'package:pet_pass/features/deals/presentation/manger/deals_cubit/deals_cubit.dart';

import 'package:pet_pass/features/deals/presentation/view/widgets/deals_view_body.dart';

class DealsView extends StatelessWidget {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) =>
                      CategoryCubit(getIt.get<DealsRepoImpl>())
                        ..fetchCategories(),
            ),
            BlocProvider(
              create:
                  (context) =>
                      DealsCubit(getIt.get<DealsRepoImpl>())
                        ..fetchAllProducts(),
            ),
          ],

          child: const DealsViewBody(),
        ),
      ),
    );
  }
}
