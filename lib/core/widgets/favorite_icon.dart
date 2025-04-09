import 'package:betna/constants.dart';
import 'package:betna/models/Item_model.dart';
import 'package:betna/view_models/favorite/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIcon extends StatefulWidget {
  FavoriteIcon({
    super.key,
    this.size = 29,
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
    var bloc = BlocProvider.of<FavoriteCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkResponse(
        //splashRadius: 20,
        onTap: () {
          setState(() {
            isFav = !isFav;
            isFav
                ? bloc.addFavorit(widget.item)
                : bloc.removeFavorit(widget.item);
            BlocProvider.of<FavoriteCubit>(context).favoritBody();
          });
        },
        child: Icon(
          isFav ? Icons.favorite : Icons.favorite_border,
          color: kPrimaryColor,
        ),
        // disabledColor: Colors.amber,
      ),
    );
  }
}
