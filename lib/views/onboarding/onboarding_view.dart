import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/models/onboarding_content_model.dart';
import 'package:betna/views/auth/widgets/image_with_text.dart';
import 'package:betna/views/onboarding/widgets/dot_indicator.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
  final PageController _pageController = PageController(initialPage: 0);
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
              onPressed:
                  () => GoRouter.of(
                    context,
                  ).pushReplacement(AppRoutes.kLoginView),
            ),
            SizedBox(
              height: 50.h,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      child: Column(
                        spacing: 25,
                        children: [
                          Image.asset(content[i].image),
                          Text(
                            content[i].discription,
                            textAlign: TextAlign.center,
                            style: FontStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDotIndecator(currentIndex: currentIndex),
                TextButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Color(0xffffffff),
                    minimumSize: Size(85, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    alignment: Alignment.center,
                  ),
                  child: Text(
                    'Next',
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
        child: Text(
          name,
          style: FontStyles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
