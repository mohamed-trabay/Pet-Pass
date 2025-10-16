import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/core/utiles/service_locator.dart';
import 'package:pet_pass/features/search/data/repos/search_repo.impl.dart';
import 'package:pet_pass/features/search/presentation/views/manger/search_cubit/search_cubit.dart';
import 'package:pet_pass/features/search/presentation/views/widgetas/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
