import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/core/constans/hive_constans.dart';
import 'package:e_commerce_app_task/core/functions/setup_service_locator.dart';
import 'package:e_commerce_app_task/core/utilies/app_router.dart';
import 'package:e_commerce_app_task/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:e_commerce_app_task/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/rating_entity.dart';
import 'package:e_commerce_app_task/features/home/domain/product_use_case/product_use_case.dart';
import 'package:e_commerce_app_task/features/home/presentation/cubit/product_cubit.dart';
import 'package:e_commerce_app_task/features/search/domain/search_use_case/search_products_use_case.dart';
import 'package:e_commerce_app_task/features/search/domain/manager/cubit/search_products_cubit.dart';
import 'package:e_commerce_app_task/features/wish_list/data/repos/wish_list_repo_impl.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(RatingEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(ProductEntityAdapter());
  }

  await Hive.openBox(kHiveBoxAuthToken);
  await Hive.openBox(kHiveBoxFavorite);
  await Hive.openBox<ProductEntity>(kHiveBoxWishlist);

  final wishBox = Hive.box<ProductEntity>(kHiveBoxWishlist);
  final tokenBox = Hive.box(kHiveBoxAuthToken);
  final token = tokenBox.get(kHiveToken);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(loginUseCase: getIt<LoginUseCase>()),
        ),
        BlocProvider(
          create: (context) =>
              ProductCubit(productUseCase: getIt<ProductUseCase>())
                ..getProducts(0),
        ),
        BlocProvider(
          create: (context) => SearchProductsCubit(
            fetchSearchProductsUseCase: getIt<SearchProductsUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              WishListCubit(wishListRepoImpl: WishListRepoImpl(box: wishBox))
                ..getAllWishListData(),
        ),
      ],
      child: ECommerceAppTask(token: token),
    ),
  );
}

class ECommerceAppTask extends StatelessWidget {
  const ECommerceAppTask({super.key, required this.token});
  final String? token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-Commerce App Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        appBarTheme: AppBarTheme(backgroundColor: kWhiteColor),
        useMaterial3: true,
        scaffoldBackgroundColor: kWhiteColor,
        brightness: Brightness.light,
      ),
      routerConfig: AppRouter.router(token),
    );
  }
}
