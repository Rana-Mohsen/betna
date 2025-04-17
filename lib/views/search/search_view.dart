import 'package:betna/constants.dart';
import 'package:betna/core/widgets/custom_item_card.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/view_models/search/cubit/search_cubit.dart';
import 'package:betna/views/search/widgets/search_view_body_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: SearchTextfield(cameraIcon: false),
      ),
      body: Padding(
        padding: kMainPadding,
        child: SafeArea(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchChanged) {
                List<ItemModel> result = state.searchedProducts;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: result.length,

                    //item: (context, index) => SizedBox(),
                    itemBuilder:
                        (context, index) => CustomItemCard(item: result[index]),
                  ),
                );
              } else {
                return SingleChildScrollView(child: SearchViewBodyCategory());
              }
            },
          ),
        ),
      ),
    );
  }
}
