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
    )..repeat();

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

    _textFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _fillController.forward();
    _fillController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        _waveController.stop();

        _circleController.forward().whenComplete(() async {
          if (mounted) {
            setState(() => _showText = true);
            await Future.delayed(const Duration(milliseconds: 150));
            _textController.forward().whenComplete(() async {
              await Future.delayed(const Duration(seconds: 4));
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
