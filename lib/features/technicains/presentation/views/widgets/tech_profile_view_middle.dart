import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/metric_card.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/technicains/presentation/manager/tech_rating_cubit/tech_rating_cubit.dart';
import 'package:plupool/features/technicains/presentation/manager/tech_rating_cubit/tech_rating_state.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/edit_rate_card.dart';

class TechProfileViewMiddle extends StatelessWidget {
  const TechProfileViewMiddle({
    super.key,
    required this.rating,
    required this.weeklyTasks,
    required this.completedTasks,
    required this.userId,
   
  });

  final double rating;
  final int weeklyTasks;
  final int completedTasks;
  final int userId;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'الإحصائيات والأداء',
              style: AppTextStyles.styleSemiBold16(context)
                  .copyWith(color: AppColors.ktextcolor),
            ),

            GestureDetector(
              onTap: () {
                final controller =
                    TextEditingController(text: rating.toString());

                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    final cubit = context.read<TechRatingCubit>();

                    return BlocConsumer<TechRatingCubit, TechRatingState>(
                      listener: (context, state) {
                        if (state is TechRatingSuccess) {
                          Navigator.pop(dialogContext);

                          context
                              .read<UsersCubit>()
                              .getUserDetails(userId);
                        }

                        if (state is TechRatingError) {
                          Navigator.pop(dialogContext);
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is TechRatingLoading;

                        return Dialog(
                          backgroundColor: AppColors.kScaffoldColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          insetPadding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.w(20),
                            vertical: SizeConfig.h(29),
                          ),
                          child: EditRateCard(
                            ratingController: controller,
                            isLoading: isLoading,

                            onSubmit: isLoading
                                ? null
                                : () {
                                    final value = double.tryParse(
                                            controller.text) ??
                                        0;

                                    cubit.updateTechRating(
                                      userId: userId,
                                    
                                      rating: value.toInt(),
                                    );
                                  },

                            onCancel: () {
                              Navigator.pop(dialogContext);
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Text(
                'تعديل',
                style: AppTextStyles.styleBold16(context).copyWith(
                  color: AppColors.kprimarycolor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: MetricCard(
                icon: Icons.star,
                iconColor: const Color(0xffFF9F1C),
                value: rating.toString(),
                label: 'التقييم',
              ),
            ),
            SizedBox(width: SizeConfig.w(6)),
            Expanded(
              child: MetricCard(
                icon: Icons.calendar_view_week,
                iconColor: const Color(0xff05B285),
                value: weeklyTasks.toString(),
                label: 'مهام الأسبوع',
              ),
            ),
            SizedBox(width: SizeConfig.w(6)),
            Expanded(
              child: MetricCard(
                icon: Icons.task_alt,
                iconColor: const Color(0xff00B4D8),
                value: completedTasks.toString(),
                label: 'مهام مكتملة',
              ),
            ),
          ],
        ),
      ],
    );
  }
}