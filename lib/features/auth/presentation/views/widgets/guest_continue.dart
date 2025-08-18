import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class GuestContinue extends StatefulWidget {
  final VoidCallback? onTap;
  const GuestContinue({super.key, this.onTap});

  @override
  State<GuestContinue> createState() => _GuestContinueState();
}

class _GuestContinueState extends State<GuestContinue>
    with SingleTickerProviderStateMixin {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    bool isWide = SizeConfig.screenWidth > 800;
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _pressed = true);
      },
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap?.call();
      },
      onTapCancel: () {
        setState(() => _pressed = false);
      },
      child: AnimatedScale(
        scale: _pressed ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/arrow-up-thin.svg', // غيّري المسار حسب مكان SVG
             
            ),
            SizedBox(width: 6),
            Text(
              "المتابعة كزائر",
              style: AppTextStyles.styleMedium20(context).copyWith(
                color: Color(0xff646464),
                fontSize: isWide ? 26 : null,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
