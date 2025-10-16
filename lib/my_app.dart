import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/localization/language_cubit/language_cubit.dart';
import 'package:pet_pass/core/theme/app_theme.dart';
import 'package:pet_pass/core/theme/theme_cubit/theme_cubit.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/features/fav/presentation/manger/fav_cubit/fav_cubit.dart';

class PetPass extends StatelessWidget {
  const PetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()..loadTheme()),
        BlocProvider(create: (context) => LanguageCubit()..loadLanguage()),
        BlocProvider(create: (context) => FavCubit()..loadFavorites()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, languageState) {
              ThemeMode currentThemeMode = ThemeMode.system;
              if (themeState is ThemeChanged) {
                currentThemeMode = themeState.themeMode;
              }

              Locale currentLocale = const Locale('en');
              if (languageState is LanguageChanged) {
                currentLocale = languageState.locale;
              }

              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: AppRouter.router,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: currentThemeMode,

                  locale: currentLocale,
                  supportedLocales: const [Locale('ar'), Locale('en')],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],

                  builder: (context, child) {
                    return Directionality(
                      textDirection:
                          currentLocale.languageCode == 'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                      child: child!,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
