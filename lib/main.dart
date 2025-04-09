import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/service_locator.dart';
import 'package:betna/simple_bloc_observer.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:betna/view_models/favorite/favorite_cubit.dart';
import 'package:betna/view_models/home/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
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
            BlocProvider(create: (context) => CartListCubit()),
            BlocProvider(create: (context) => FavoriteCubit()),
            BlocProvider(create: (context) => CategoriesCubit()),
          ],
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
               statusBarIconBrightness: Brightness.dark,
            ),

            child: MaterialApp.router(
              routerConfig: AppRoutes.routes,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "Roboto",
                appBarTheme: AppBarTheme(
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
