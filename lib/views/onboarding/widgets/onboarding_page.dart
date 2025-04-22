import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/models/onboarding_content_model.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.content});
 final OnboardingContentModel content;
  @override
  Widget build(BuildContext context) {
   
    return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      child: Column(
                        spacing: 25,
                        children: [
                          Image.asset(content.image),
                          Text(
                            content.discription,
                            textAlign: TextAlign.center,
                            style: FontStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
  }
}