import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
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
  late Animation<double> _circleSlideAnimation;

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

    _textFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    ));

    // Listeners
    _waveController.addListener(() => mounted ? setState(() {}) : null);
    _fillController.addListener(() => mounted ? setState(() {}) : null);
    _circleController.addListener(() => mounted ? setState(() {}) : null);
    _textController.addListener(() => mounted ? setState(() {}) : null);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _waveController.reset();
      _fillController.value = 0.0;
      _circleController.value = 0.0;
      _textController.value = 0.0;

      _waveController.repeat();
      _fillController.forward(from: 0.0);
    });

    _fillController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        _waveController.stop();

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
    SizeConfig.init(context);

    final screenWidth = SizeConfig.isWideScreen?(SizeConfig.screenWidth * 0.25):(SizeConfig.screenWidth * 0.35);

    _circleSlideAnimation =
        Tween<double>(begin: 0, end: -screenWidth ).animate(
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
    final screenWidth = SizeConfig.screenWidth;

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
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: SizeConfig.w( 18)),
                          child: Text(
                            "PLUPOOL",
                            style: AppTextStyles.styleBold42(context),
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
