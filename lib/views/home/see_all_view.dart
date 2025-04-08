import 'package:betna/core/widgets/custom_appbar.dart';
import 'package:betna/views/home/widgets/see_all_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key, required this.ctg});
  final String ctg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: ctg, onTapBackIcon: () => context.pop()),
      body: SeeAllViewBody(ctg: ctg.toLowerCase()),
    );
  }
}
