import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/select_role_item.dart';

class SelectRoleViewBody extends StatelessWidget {
  const SelectRoleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.h(146),
        left: SizeConfig.h(20),
        right: SizeConfig.w(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textDirection: TextDirection.rtl,
            "كيف تريد استخدام Blupool ؟",
            style: AppTextStyles.styleBold20(context),
          ),
          SizedBox(height: SizeConfig.h(70)),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
              itemCount: kRoleItems.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemBuilder: (context, index) {
                return SelectRoleItem(item: kRoleItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
