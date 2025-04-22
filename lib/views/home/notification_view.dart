import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/widgets/custom_appbar.dart';
import 'package:betna/views/home/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Notification",
        onTapBackIcon: () => context.go(AppRoutes.kBottomNavigation,extra: 0),
      ),
      body: const Padding(padding: kMainPadding, child: NotificationViewBody()),
    );
  }
}
