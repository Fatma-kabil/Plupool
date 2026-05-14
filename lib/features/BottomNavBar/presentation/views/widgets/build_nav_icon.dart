import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

Widget buildNavIcon(IconData path, {Color? color}) {
    return Icon(
      path,
      size: SizeConfig.w(24),
    //  height: SizeConfig.h(24),
      color:color
     
    );
  }
