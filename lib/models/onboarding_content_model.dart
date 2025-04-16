class OnboardingContentModel {
  final String image;
  final String discription;

  OnboardingContentModel({required this.image, required this.discription});
}

List<OnboardingContentModel> content = [
  OnboardingContentModel(
    image: 'assets/images/onboarding1.png',
    discription:
        "Design your dream space with interiors that reflect your style!",
  ),
  OnboardingContentModel(
    image: 'assets/images/onboarding2.png',
    discription:
        "Find the perfect gift in our selection of designer decorative objects.",
  ),
  OnboardingContentModel(
    image: 'assets/images/onboarding3.png',
    discription: "We Deliver The Products You Bought To Your Door",
  ),
];
