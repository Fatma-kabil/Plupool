import 'package:flutter/cupertino.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/privacy_header.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.w(22),
        right: SizeConfig.w(22),
        top: SizeConfig.h(35),
        bottom: SizeConfig.h(22),
      ),
      child: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrivacyHeader(),
             const SizedBox(height: 10),
            ]
        ),
      ),
    );
  }
}
