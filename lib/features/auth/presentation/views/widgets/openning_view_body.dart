import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/openning_view_footer.dart';

class OpenningViewBody extends StatelessWidget {
  const OpenningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/openning.png',
          fit: BoxFit.fill, // تملى الشاشة
        ),
        Positioned(
          top: SizeConfig.h(50),
          left: 0,
          right: 0,
          child: Image.asset('assets/images/PluPool.png'),
        ),
        Positioned(
          bottom: 45,
          left: 0,
          right: 0,
          child: OpenningViewFooter(),
        ),
      ],
    );
  }
}
