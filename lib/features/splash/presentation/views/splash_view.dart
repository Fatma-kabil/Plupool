import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:plupool/features/splash/presentation/views/widgets/zoom_fade.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _mainCtl;

  @override
   void initState() {
    super.initState();
    

    _mainCtl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // نخلي الأنيميشن يبدأ بعد أول Frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mainCtl.forward();
    });

    // بعد انتهاء الأنيميشن انتقل للشاشة التالية
    _mainCtl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const OnboardView()),
);
 // عدل route هنا
        });
      }
    });
  }

  @override
  void dispose() {
    _mainCtl.dispose();
    super.dispose();
  }

  Widget _logoSvg(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final logoWidth = screenWidth * 0.7; // 50% من عرض الشاشة
    final logoHeight =
        logoWidth / 5.8125; // الحفاظ على نفس النسبة الأصلية// 45% من عرض الشاشة
    return SizedBox(
      width: logoWidth,
      height: logoHeight,
      child: SvgPicture.asset(logo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: ZoomFadeBgPro(controller: _mainCtl, child: _logoSvg(context)),
      ),
    );
  }
}
