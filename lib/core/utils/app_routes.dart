import 'package:betna/core/services/auth_api.dart';
import 'package:betna/core/utils/service_locator.dart';
import 'package:betna/core/widgets/bottom_navigation.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/navigation_logger.dart';
import 'package:betna/view_models/auth/auth_bloc.dart';
import 'package:betna/view_models/search/cubit/search_cubit.dart';
import 'package:betna/views/auth/login_view.dart';
import 'package:betna/views/auth/signup_view.dart';
import 'package:betna/views/cart/cart_view.dart';
import 'package:betna/views/cart/my_order_view.dart';
import 'package:betna/views/favorite/favorite_view.dart';
import 'package:betna/views/home/home_view.dart';
import 'package:betna/views/home/notification_view.dart';
import 'package:betna/views/home/product_view.dart';
import 'package:betna/views/home/see_all_view.dart';
import 'package:betna/views/onboarding/onboarding_view.dart';
import 'package:betna/views/order/place_order_view.dart';
import 'package:betna/views/profile/profile_view.dart';
import 'package:betna/views/profile/widgets/edit_profile_info.dart';
import 'package:betna/views/search/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kLoginView = '/loginView';
  static const kSignupView = '/signupView';
  static const kOnboardingView = '/onboardingView';
  static const kBottomNavigation = '/bottomNavigation';
  static const kHomeView = '/homeView';
  static const kSeeAllview = '/seeAllView';
  static const kNotificationView = '/notificationView';
  static const kProductView = '/productView';
  static const kFavoriteView = '/favoriteView';
  static const kCartView = '/cartView';
  static const kMyOrderView = '/myOrderView';
  static const kProfileView = '/profileView';
  static const kEditProfileInfo = '/editProfileInfo';
  static const kSearchView = '/searchView';
  static const kPlaceOrderView = '/placeOrderView';

  static final routes = GoRouter(
    observers: [NavigationLogger()],
    initialLocation: kOnboardingView,

    routes: [
      GoRoute(
        path: kLoginView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthBloc(getIt.get<AuthApi>()),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: kSignupView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthBloc(getIt.get<AuthApi>()),
              child: const SignupView(),
            ),
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const Onboarding(),
      ),

      GoRoute(
        path: kBottomNavigation,
        builder: (context, state) {
          final index = state.extra as int? ?? 0;
          return BottomNavigation(initialIndex: index);
        },
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kSeeAllview,
        builder: (context, state) => SeeAllView(ctg: state.extra as String),
      ),

      GoRoute(
        path: kNotificationView,
        builder: (context, state) => const NotificationView(),
      ),
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
        builder:
            (context, state) =>
                MyOrderView(cartList: state.extra as List<CartModel>),
      ),

      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kEditProfileInfo,
        builder: (context, state) => const EditProfileInfo(),
      ),
      GoRoute(
        path: kSearchView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SearchCubit(),
              child: const SearchView(),
            ),
      ),
       GoRoute(
        path: kPlaceOrderView,
        builder: (context, state) => const PlaceOrderView(),
      ),
    ],
  );
}
