import 'package:go_router/go_router.dart';
import 'package:pet_pass/features/auth/presentation/views/forget_password_view.dart';
import 'package:pet_pass/features/auth/presentation/views/sign_in_view.dart';
import 'package:pet_pass/features/auth/presentation/views/sign_up_view.dart';
import 'package:pet_pass/features/Profiel/presentation/views/profiel_view.dart';
import 'package:pet_pass/features/Profiel/presentation/views/settings_view.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/home/presentation/viwes/home_view.dart';
import 'package:pet_pass/features/home/presentation/viwes/item_details_view.dart';
import 'package:pet_pass/features/home/presentation/viwes/newest_items_view.dart';
import 'package:pet_pass/features/main_layout/presentation/views/main_layout.dart';
import 'package:pet_pass/features/premium/presentaion/views/premium_view.dart';
import 'package:pet_pass/features/search/presentation/views/search_view.dart';
import 'package:pet_pass/features/splash/presentation/views/splash_view.dart';
import 'package:pet_pass/features/deals/presentation/view/deals_view.dart';

abstract class AppRouter {
  static const kHomeView = '/home';
  static const kCategoryView = '/categories';
  static const kCartView = '/cart';

  static const kNewestItemsView = '/newestItems';
  static const kItemDetailsView = '/itemDetails';
  static const kSerchView = '/searchview';
  static const kStoreView = '/storeview';
  static const kUserDetailsView = '/userview';
  static const kPaymentsView = '/paymentview';
  static const kPrpfielView = '/profielview';
  static const ksettingsView = '/settingsview';
  static const ksignInView = '/signinview';

  static const ksignUpView = '/signupview';
  static const kForgetPassword = '/forgetpasswordview';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),

      ShellRoute(
        builder: (context, state, child) {
          return const MainLayout();
        },
        routes: [
          GoRoute(
            path: kHomeView,
            builder: (context, state) => const HomeView(),
          ),
        ],
      ),

      GoRoute(
        path: ksettingsView,
        builder: (context, state) => const SettingsView(),
      ),

      GoRoute(
        path: kNewestItemsView,
        builder: (context, state) => const NewestItemsView(),
      ),
      GoRoute(
        path: kPrpfielView,
        builder: (context, state) => const ProfielView(),
      ),
      GoRoute(
        path: kItemDetailsView,
        builder: (context, state) {
          final productmodel = state.extra as OfferModel;
          return ItemDetailsView(productmodel: productmodel);
        },
      ),
      GoRoute(
        path: kSerchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(path: kStoreView, builder: (context, state) => const DealsView()),
      // GoRoute(
      //   path: kUserDetailsView,
      //   builder: (context, state) {
      //     final amount = state.extra as double;

      //     return UserDetailsView(amount: amount);
      //   },
      // ),

      // GoRoute(
      //   path: kPaymentsView,
      //   builder: (context, state) {
      //     final data = state.extra as Map<String, dynamic>;
      //     final amount = data['amount'] as double;
      //     final orderId = data['orderId'] as String;

      //     return PaymentPage(amount: amount, orderId: orderId, iframeUrl: '');
      //   },
      // ),
      GoRoute(path: ksignInView, builder: (context, state) => LoginScreen()),
      GoRoute(path: ksignUpView, builder: (context, state) => SignUpScreen()),
      GoRoute(
        path: kPaymentsView,
        builder: (context, state) => const PremiumView(),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
  );
}
