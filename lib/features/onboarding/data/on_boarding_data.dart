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
    title: "انشئ حمامك بطريقه حديثه و\n بمجموعة من المهندسين تتعدى\n خبرتهم عشرات السنين في السوق",
    subtitle: "ننفّذ تصميمك بدقة مع محاكاة 3D\n قبل التنفيذ!",
  ),
  OnboardingItem(
    image: "assets/images/onboarding2.png",
    title: "صيانه مستمره من فنيين علي اعلي \nمستوى وتقييمات مستمره في\n التطبيق",
    subtitle: "نقدم لك صيانة ذكية بضغطة زر وقت ما\nتحب!",
  ),
  OnboardingItem(
    image: "assets/images/onboarding3.png",
    title: "شريكك الموثوق في إنشاء حمامات \nسباحة ذكية ، بدعم احترافي للمطورين \nالعقاريين والمشروعات الكبرى",
    subtitle: "نقدّم لك صيانة وتنظيف ذكي بضغطة زر، \nوقت ما تحب!",
  ),
];
