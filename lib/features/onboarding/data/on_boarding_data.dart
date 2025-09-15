class OnboardingItem {
  final String image;
  final String title;
  

  OnboardingItem({
    required this.image,
    required this.title,
  
  });
}

final onboardingItems = [
  OnboardingItem(
    image: "assets/images/onboarding1.jpg",
    title: "انشئ تصميمك بدقه مع محاكاه 3D قبل \nالتنفيذ  من المهندسين تتعدي \nخبرتهم عشرات السنين في السوق",
    
  ),
  OnboardingItem(
    image: "assets/images/onboarding2.jpg",
    title: "صيانه ذكيه من فنيين علي اعلي مستوي \nوتقييمات مستمره داخل التطبيق",
    
  ),
  OnboardingItem(
    image: "assets/images/onboarding3.jpg",
    title: "شريكك الموثوق في إنشاء حمامات \nسباحة ذكية ، بدعم احترافي للمطورين \nالعقاريين والمشروعات الكبرى",
    
  ),
];
