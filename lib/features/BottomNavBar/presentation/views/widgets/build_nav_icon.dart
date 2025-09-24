import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/utils/size_config.dart';

Widget buildNavIcon(String path, {Color? color}) {
    return SvgPicture.asset(
      path,
      width: SizeConfig.w(24),
      height: SizeConfig.h(24),
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
