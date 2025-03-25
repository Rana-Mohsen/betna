import 'package:betna/view_models/home/categories_cubit.dart';
import 'package:betna/views/home/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MultiBlocProvider(
          providers: [
          BlocProvider( create: (context) => CategoriesCubit(),),
             //BlocProvider( create: (context) => CartListCubit(),)
          ],
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
