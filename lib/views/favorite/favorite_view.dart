import 'package:betna/core/widgets/profile_image.dart';
import 'package:betna/views/favorite/favorite_view_body.dart';
import 'package:flutter/material.dart';

class FavoritView extends StatelessWidget {
  const FavoritView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
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
