import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pet_pass/features/fav/presentation/manger/fav_cubit/fav_cubit.dart';
import 'package:pet_pass/features/fav/presentation/views/fav_view.dart';
import 'package:pet_pass/features/home/presentation/viwes/home_view.dart';
import 'package:pet_pass/features/main_layout/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:pet_pass/features/deals/presentation/view/deals_view.dart';
import 'package:pet_pass/features/premium/presentaion/views/premium_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _screens = const [
    HomeView(),
    DealsView(),
    FavView(),
    PremiumView(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    context.read<FavCubit>().loadFavorites();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: _screens,
      ),
      bottomNavigationBar: BlocBuilder<FavCubit, FavState>(
        builder: (context, favState) {
          int favCount = 0;
          if (favState is FavoritesSuccess) {
            favCount = favState.favorites.length;
          }

          return CustomBottomNav(
            currentIndex: _currentIndex,
            favCount: favCount,
            onTap: (index) {
              setState(() => _currentIndex = index);
              _pageController.jumpToPage(index);
            },
          );
        },
      ),
    );
  }
}
