import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/localization/language_cubit/language_cubit.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_item.dart';
import 'package:pet_pass/features/search/presentation/views/manger/search_cubit/search_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        context.read<LanguageCubit>().stream.listen((langState) {
          if (langState is LanguageChanged) {
            context.read<SearchCubit>();
          }
        });
      },
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          if (state.products.isEmpty) {
            return Center(child: Text(lang.noResult));
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return CustomItem(productModel: state.products[index]);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 17,
              childAspectRatio: 2.4 / 4,
            ),
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return Center(child: Text(lang.searchToShow));
      },
    );
  }
}
