import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: SpinKitCircle(
        color: Colors.grey,
        size: SizeConfig.screenWidth*0.17,
      ),
    );
  }
}