class OnboardingItem {
  final String image;
  final String title;
  final String subtitle;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final onboardingItems = [
  OnboardingItem(
    image: "assets/images/onboarding1.png",
    title: "انشئ حمامك بطريقه حديثه و بمجموعة من المهندسين تتعدى خبرتهم عشرات السنين في السوق",
    subtitle: "ننفّذ تصميمك بدقة مع محاكاة 3D قبل التنفيذ!",
  ),
  OnboardingItem(
    image: "assets/images/onboarding2.png",
    title: "صيانه مستمره من فنيين علي اعلي مستوى وتقييمات مستمره في التطبيق",
    subtitle: "نقدم لك صيانة ذكية بضغطة زر وقت ما تحب",
  ),
  OnboardingItem(
    image: "assets/images/onboarding3.png",
    title: "شريكك الموثوق في إنشاء حمامات سباحة ذكية ، بدعم احترافي للمطورين العقاريين والمشروعات الكبرى",
    subtitle: "!نقدّم لك صيانة وتنظيف ذكي بضغطة زر، وقت ما تحب",
  ),
];
