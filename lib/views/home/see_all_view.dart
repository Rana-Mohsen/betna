import 'package:betna/core/widgets/profile_image.dart';
import 'package:betna/view_models/favorite/favorite_cubit.dart';
import 'package:betna/views/favorite/favorite_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("*all*"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: ProfileImage(),
          ),
        ],
      ),
      body: FavoriteViewBody(),
    );
  }
}
