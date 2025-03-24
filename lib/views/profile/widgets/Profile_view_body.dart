import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  final List<Map<String, String>> listTileData = const [
    {"icon": "assets/icons/profile/battery.png", "title": "History of order"},
    {"icon": "assets/icons/profile/pay_method.png", "title": "Payment method"},
    {"icon": "assets/icons/profile/notification.png", "title": "Notification"},
    {"icon": "assets/icons/profile/reward_card.png", "title": "Reward card"},
    {"icon": "assets/icons/profile/promo_code.png", "title": "Promo code"},
    {"icon": "assets/icons/profile/privacy.png", "title": "Privacy & policy"},
    {"icon": "assets/icons/profile/lang.png", "title": "Language"},
    {"icon": "assets/icons/profile/help.png", "title": "Help"},
    {"icon": "assets/icons/profile/lang.png", "title": "Language"},
    {"icon": "assets/icons/profile/help.png", "title": "Help"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ProfileImage(),
          title: Text("Omar ali"),
          subtitle: Text("OmarAli2000@gmail.com"),
          trailing: Icon(FontAwesome.pen_to_square),
        ),
        Divider(indent: 16, endIndent: 16),
        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: listTileData.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: SizedBox(
                  height: 2.8.h,
                  width: 6.w,
                  child: Image.asset(listTileData[index]["icon"]!),
                ),
                title: Text(listTileData[index]["title"]!),
                titleTextStyle: FontStyles.textStyle18,
                textColor: Color(0xff575757),
                // subtitle: Text("OmarAli2000@gmail.com"),
                trailing:
                    index < 8
                        ? IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios),
                        )
                        : null,
              );
            },
          ),
        ),

        // ListTile(
        //   leading: SizedBox(height: 3.h, child: Icon(Icons.ios_share_outlined)),
        //   title: Text("share"),
        //   titleTextStyle: FontStyles.textStyle18,
        //   textColor: Color(0xff575757),
        //   // subtitle: Text("OmarAli2000@gmail.com"),
        // ),
      ],
    );
  }
}
