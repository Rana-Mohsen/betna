import 'package:betna/constants.dart';
import 'package:betna/core/Local_Storage/local_cart.dart';
import 'package:betna/core/services/api_service/cart_api.dart';
import 'package:betna/core/services/api_service/category.api.dart';
import 'package:betna/core/services/api_service/products_api.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/service_locator.dart';
import 'package:betna/models/local_cart_model.dart';
import 'package:betna/simple_bloc_observer.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:betna/view_models/favorite/favorite_cubit.dart';
import 'package:betna/view_models/home/category_cubit/categories_cubit.dart';
import 'package:betna/view_models/home/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalCartModelAdapter());
  await Hive.deleteBoxFromDisk(kCartBox);

  await Hive.openBox<List<LocalCartModel>>(kCartBox);
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) => CartListCubit(getIt.get<CartApi>(), LocalCart()),
            ),
            BlocProvider(create: (context) => FavoriteCubit()),
            BlocProvider(
              create: (context) => CategoriesCubit(getIt.get<CategoryApi>()),
            ),
            BlocProvider(
              create: (context) => ProductsCubit(getIt.get<ProductsApi>()),
            ),
          ],
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),

            child: MaterialApp.router(
              routerConfig: AppRoutes.routes,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "Roboto",
                textSelectionTheme: const TextSelectionThemeData(
                  selectionHandleColor: kPrimaryColor,
                  selectionColor: kBackgroundColor,
                ),
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                  scrolledUnderElevation: 0,
                  backgroundColor: Colors.transparent,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
