import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/comment_input.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reviews_list.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تقييم الخدمة من عملائنا",
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),

        /// هنا نستخدم BlocBuilder للتحقق من حالة تسجيل الدخول
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState.status == AuthStatus.loggedIn) {
              /// لو مسجل دخول → نعرض CommentInput
              return Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "قيّم تجربتك معنا",
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: const Color(0xff555555)),
                      ),
                      SizedBox(width: SizeConfig.w(34)),
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star_border,
                          color: const Color(0xffFFD423),
                          size: SizeConfig.w(18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CommentInput(imageUrl: imageUrl),
                  const SizedBox(height: 17),
                ],
              );
            }

            /// لو ضيف → نعرض فاصل فقط (أو يمكن تجاهله)
            return SizedBox.shrink();
          },
        ),

        /// شريط المراجعات موجود دائماً
        ReviewsList(),
      ],
    );
  }
}
