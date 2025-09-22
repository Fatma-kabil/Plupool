
import 'package:flutter/widgets.dart';
import 'package:plupool/core/utils/size_config.dart';

class SuccessImage extends StatelessWidget {
  const SuccessImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/success_frame.png",
          width: SizeConfig.w(190),
          height: SizeConfig.h(180),
          fit: BoxFit.contain,
        ),
        Image.asset(
          "assets/images/check.png",
         width: SizeConfig.w(122),
          height: SizeConfig.h(122),
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
