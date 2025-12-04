import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/error_card.dart';

class ReserveOfferBtn extends StatelessWidget {
  const ReserveOfferBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        return Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.h(4)),
          child: GestureDetector(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.kprimarycolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.h(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'حجز الخدمة',
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                      SizedBox(width: SizeConfig.w(8)),
                      Icon(
                        Icons.arrow_forward,
                        size: SizeConfig.w(12),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {
              if (authState.status == AuthStatus.guest) {
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
                // مسجل دخول - اعمل العملية المطلوبة هنا
                print('Added to cart');
              }
            },
          ),
        );
      },
    );
  }
}
