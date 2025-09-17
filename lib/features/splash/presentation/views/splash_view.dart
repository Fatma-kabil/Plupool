import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/features/splash/presentation/views/widgets/animated_circle.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _waveController;
  late final AnimationController _fillController;
  late final Animation<double> _fillAnimation;

  late final AnimationController _circleController;
  late final Animation<double> _circleSlideAnimation;

  late final AnimationController _textController;
  late final Animation<double> _textSlideAnimation;
  late final Animation<double> _textFadeAnimation;

  bool _showText = false;
@override
void initState() {
  super.initState();

  _waveController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  );

  _fillController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  );

  _fillAnimation = CurvedAnimation(
    parent: _fillController,
    curve: Curves.linear,
  );

  _circleController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );

  _textController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );

  _textSlideAnimation = CurvedAnimation(
    parent: _textController,
    curve: Curves.easeOut,
  );

  _textFadeAnimation = Tween<double>(begin: 0, end: 1)
      .animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

  // Optional: listeners لو حابب (مش ضروري لو AnimatedBuilder بيستمع)
  _waveController.addListener(() { if (mounted) setState(() {}); });
  _fillController.addListener(() { if (mounted) setState(() {}); });
  _circleController.addListener(() { if (mounted) setState(() {}); });
  _textController.addListener(() { if (mounted) setState(() {}); });

  // مهم: نبدأ كل الـ animations بعد أول frame وبالقيمة 0
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!mounted) return;

    // رجّع القيم لـ 0 للتأكّد
    _waveController.reset();
    _fillController.value = 0.0;
    _circleController.value = 0.0;
    _textController.value = 0.0;

    // ابدأ الموجة وملء الدايرة في نفس اللحظة (من 0)
    _waveController.repeat();
    _fillController.forward(from: 0.0);
  });

  // لما يخلص الـ fillController زي ما عندك
  _fillController.addStatusListener((status) {
    if (status == AnimationStatus.completed && mounted) {
      _waveController.stop();

      // ابدأ الـ circle والـ text من البداية (from: 0) عشان يتأكدوا بيبتدوا من أول
      _circleController.forward(from: 0.0).whenComplete(() async {
        if (mounted) {
          setState(() => _showText = true);
          await Future.delayed(const Duration(milliseconds: 150));
          _textController.forward(from: 0.0).whenComplete(() async {
            await Future.delayed(const Duration(seconds: 2));
            if (mounted) {
              context.go('/onboarding');
            }
          });
        }
      });
    }
  });
}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    _circleSlideAnimation =
        Tween<double>(begin: 0, end: -(screenWidth / 2) + 80).animate(
          CurvedAnimation(parent: _circleController, curve: Curves.easeInOut),
        );
  }

  @override
  void dispose() {
    _waveController.dispose();
    _fillController.dispose();
    _circleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: screenWidth,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedCircle(
                waveController: _waveController,
                fillAnimation: _fillAnimation,
                slideAnimation: _circleSlideAnimation,
              ),
              if (_showText)
                AnimatedBuilder(
                  animation: _textController,
                  builder: (context, _) {
                    return Opacity(
                      opacity: _textFadeAnimation.value,
                      child: Transform.translate(
                        offset: Offset(
                          (1 - _textSlideAnimation.value) * 100,
                          0,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Text(
                            "PLUPOOL",
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0077B6),
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}