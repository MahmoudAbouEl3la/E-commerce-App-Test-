import 'package:e_commerce_app_task/core/utilies/routes.dart';
import 'package:e_commerce_app_task/features/auth/login/presentation/login_screen.dart';
import 'package:e_commerce_app_task/features/details/presentation/details_screen.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/home/presentation/home_screen.dart';
import 'package:e_commerce_app_task/features/page_view/layout.dart';
import 'package:e_commerce_app_task/features/search/presentation/search_view.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/wish_list_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router(String? token) {
    return GoRouter(
      initialLocation: token == null ? Routes.loginScreen : Routes.layoutScreen,
      routes: [
        GoRoute(
          path: Routes.loginScreen,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: Routes.homeScreen,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: Routes.searchScreen,
          builder: (context, state) => const SearchView(),
        ),
        GoRoute(
          path: Routes.detailsScreen,
          builder: (context, state) {
            final productEntity = state.extra as ProductEntity;
            return DetailsScreen(productEntity: productEntity);
          },
        ),
        GoRoute(
          path: Routes.wishListScreen,
          builder: (context, state) => const WishListScreen(),
        ),
        GoRoute(
          path: Routes.layoutScreen,
          builder: (context, state) => const Layout(),
        ),
      ],
    );
  }
}
