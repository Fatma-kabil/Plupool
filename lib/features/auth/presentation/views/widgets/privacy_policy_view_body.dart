import 'package:flutter/cupertino.dart';
import 'package:plupool/core/utils/size_config.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.w(22),
        right: SizeConfig.w(22),
        top: SizeConfig.h(50),
        bottom: SizeConfig.h(22),
      ),
      child: ListView(),
    );
  }
}
