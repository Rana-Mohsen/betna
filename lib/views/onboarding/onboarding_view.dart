import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/models/onboarding_content_model.dart';
import 'package:betna/views/onboarding/widgets/dot_indicator.dart';
import 'package:betna/views/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //const SizedBox(height: 40),
            OnBoardSkipButton(
              name: "Skip",
              onPressed: () => GoRouter.of(context).go(AppRoutes.kLoginView),
            ),
            SizedBox(
              height: 50.h,
              child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: OnboardingPage(
              
              content: content[currentIndex],
            ),
          ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDotIndecator(currentIndex: currentIndex),
                TextButton(
                  onPressed: () {
                     if (currentIndex < content.length - 1) {
                    setState(() {
                      currentIndex++;
                    });
                  } else {
                    GoRouter.of(context).go(AppRoutes.kLoginView);
                  }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: const Color(0xffffffff),
                    minimumSize: const Size(85, 44),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    alignment: Alignment.center,
                  ),
                  child: Text(
                    currentIndex == content.length - 1 ? 'Done' : 'Next',
                    style: FontStyles.textStyle18.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class OnBoardSkipButton extends StatelessWidget {
  const OnBoardSkipButton({
    super.key,
    required this.name,
    required this.onPressed,
  });
  final String name;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          child: Text(
            name,
            style: FontStyles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
