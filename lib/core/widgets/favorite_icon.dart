import 'package:betna/constants.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/view_models/favorite/favorite_cubit.dart';
import 'package:betna/view_models/home/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIcon extends StatefulWidget {
  FavoriteIcon({
    super.key,
    this.size = 21,
    this.padding = 1,
    required this.item,
  });

  final double? size;
  ItemModel item;
  final double padding;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    bool isFav = widget.item.isFav;
        final favoriteCubit = context.read<FavoriteCubit>();
    final productsCubit = context.read<ProductsCubit>();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          // isFav = !isFav;
         if (widget.item.isFav) {
            favoriteCubit.addFavorit(widget.item);
          } else {
            favoriteCubit.removeFavorit(widget.item);
          }

          productsCubit.toggleFavorite(widget.item);

          favoriteCubit.favoritBody(); 
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(widget.padding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            widget.item.isFav ? Icons.favorite : Icons.favorite_border_outlined,
            size: widget.size,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
