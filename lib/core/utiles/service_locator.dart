import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_pass/core/services/api_service.dart';
import 'package:pet_pass/core/services/auth_service.dart';
import 'package:pet_pass/features/auth/data/repo/auth_repo.dart';
import 'package:pet_pass/features/auth/data/repo/auth_repo_impl.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:pet_pass/features/home/data/repos/home.repo.impl.dart';
import 'package:pet_pass/features/search/data/repos/search_repo.impl.dart';
import 'package:pet_pass/features/deals/data/repo/deals_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // ===== Core - Dio =====
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        validateStatus: (status) => status! < 500,
      ),
    ),
  );

  // ===== Core - Secure Storage =====
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // ===== ApiService =====
  getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));

  // ===== Auth Service =====
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(getIt<Dio>(), storage: getIt<FlutterSecureStorage>()),
  );

  // ===== Auth Repo =====
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthService>()),
  );

  // ===== Auth Cubit (Factory للحصول على instance جديد) =====
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));

  // ===== Home Repo =====
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt<ApiService>()),
  );

  // ===== Deals Repo =====
  getIt.registerSingleton<DealsRepoImpl>(
    DealsRepoImpl(apiService: getIt<ApiService>()),
  );

  // ===== Search Repo =====
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(apiService: getIt<ApiService>()),
  );
}
