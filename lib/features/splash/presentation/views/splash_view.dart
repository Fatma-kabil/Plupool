import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
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
      duration: const Duration(seconds: 4),
    );

    // نخلي الأنيميشن يبدأ بعد أول Frame
    _mainCtl.forward();

    // بعد انتهاء الأنيميشن انتقل للشاشة التالية
    _mainCtl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 3), () {
          context.go('/onboarding');
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
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: ZoomFadeBgPro(controller: _mainCtl, child: _logoSvg(context)),
      ),
    );
  }
}
