import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/error_card.dart';

class PackageCard extends StatelessWidget {
  final String title;
  final List<String> services;
  final VoidCallback onSelect;

  const PackageCard({
    super.key,
    required this.title,
    required this.services,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: AppTextStyles.styleBold14(context)),
          const SizedBox(height: 16),
          Container(
            height: SizeConfig.isWideScreen
                ? SizeConfig.w(160)
                : SizeConfig.h(193),
            width: double.infinity,
            padding: EdgeInsets.only(
              left: SizeConfig.w(15),
              right: SizeConfig.w(15),
              top: SizeConfig.h(10),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffBBBBBB)),
              color: AppColors.kScaffoldColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: services
                  .map(
                    (service) => Padding(
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.h(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            service,
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.styleRegular16(
                              context,
                            ).copyWith(color: AppColors.ktextcolor),
                          ),
                          SizedBox(width: SizeConfig.w(8)),
                          SvgPicture.asset(
                            "assets/icons/done.svg",
                            height: SizeConfig.h(16),
                            width: SizeConfig.w(16),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 40),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return CustomTextBtn(
                text: "اختيار الباقة",
                width: double.infinity,
                onPressed: () {
                  if (state.status == AuthStatus.guest) {
                    // لو ضيف — نعرض رسالة الخطأ
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ErrorCard(
                          title: 'لم يتم تسجيل الدخول',
                          subtitle:
                              'لتستمتع بتجربتك وتتابع خدماتك، قم بتسجيل الدخول أولاً.',
                          color: Colors.white,
                        );
                      },
                    );
                  } else {
                    onSelect;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
