import 'package:betna/core/services/auth_api.dart';
import 'package:betna/core/utils/service_locator.dart';
import 'package:betna/core/widgets/bottom_navigation_bar.dart';
import 'package:betna/models/Item_model.dart';
import 'package:betna/view_models/auth/auth_bloc.dart';
import 'package:betna/view_models/home/categories_cubit.dart';
import 'package:betna/views/auth/login_view.dart';
import 'package:betna/views/auth/signup_view.dart';
import 'package:betna/views/cart/cart_view.dart';
import 'package:betna/views/cart/my_order_view.dart';
import 'package:betna/views/favorite/favorite_view.dart';
import 'package:betna/views/home/home_view.dart';
import 'package:betna/views/home/product_view.dart';
import 'package:betna/views/profile/profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kLoginView = '/loginView';
  static const kSignupView = '/signupView';
  static const kBottomNavigationView = '/bottomVavigationView';
  static const kHomeView = '/homeView';
  static const kProductView = '/productView';
  static const kFavoriteView = '/favoriteView';
  static const kCartView = '/cartView';
  static const kMyOrderView = '/myOrderView';
  static const kProfileView = '/profileView';

  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthBloc(getIt.get<AuthApi>()),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kBottomNavigationView,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [BlocProvider(create: (context) => CategoriesCubit())],
              child: BottomNavigation(),
            ),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kProductView,
        builder:
            (context, state) => ProductView(item: state.extra as ItemModel),
      ),
      GoRoute(
        path: kFavoriteView,
        builder: (context, state) => const FavoritView(),
      ),
      GoRoute(path: kCartView, builder: (context, state) => const CartView()),
      GoRoute(
        path: kMyOrderView,
        builder: (context, state) => const MyOrderView(),
      ),

      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}
