import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_pass/core/utiles/api_service.dart';
import 'package:pet_pass/features/home/data/repos/home.repo.impl.dart';
import 'package:pet_pass/features/search/data/repos/search_repo.impl.dart';
import 'package:pet_pass/features/deals/data/repo/deals_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // ApiService
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // Home Repo
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );

  // deals Repo
  getIt.registerSingleton<DealsRepoImpl>(
    DealsRepoImpl(apiService: getIt.get<ApiService>()),
  );

  // Search Repo
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
