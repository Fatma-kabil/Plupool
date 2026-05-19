import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/metric_card.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_info_card_row_shimmer.dart';

class TechInfoCardRow extends StatefulWidget {
  final int userId;

  const TechInfoCardRow({super.key, required this.userId});

  @override
  State<TechInfoCardRow> createState() => _TechInfoCardRowState();
}

class _TechInfoCardRowState extends State<TechInfoCardRow> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsersCubit>().getUserDetails(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<AuthCubit, AuthState>(
    //  builder: (context, authState) {
    // final isGuest = authState.status == AuthStatus.guest;

    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        print(state.runtimeType);
        
        if (state is UserDetailsSuccess) {
          print("USER => ${state.user}");
          print("STATS => ${state.user.statistics}");
          final user = state.user;

          final rating = user.statistics['average_rating'] ?? 0;
          final completedTasks = user.statistics['completed_tasks'] ?? 0;
          final weeklyTasks = user.statistics['weekly_tasks'] ?? 0;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// ⭐ rating
              Expanded(
                child: MetricCard(
                  icon: Icons.star,
                  iconColor: const Color(0xffFF9F1C),
                  label: 'التقييم',
                  value:
                      // isGuest
                      //   ? toArabicNumbers("0")
                      // :
                      toArabicNumbers(rating.toString()),
                  valueTextStyle:
                      // isGuest
                      //   ? AppTextStyles.styleBold16(context).copyWith(
                      //     color: const Color(0xff555555),
                      //   )
                      //:
                      null,
                ),
              ),

              SizedBox(width: SizeConfig.w(6)),

              /// 📅 weekly tasks
              Expanded(
                child: MetricCard(
                  icon: Icons.calendar_view_week,
                  iconColor: const Color(0xff05B285),
                  label: 'مهام الأسبوع',
                  value:
                      // isGuest
                      //  ? "لا يوجد"
                      // :
                      toArabicNumbers(weeklyTasks.toString()),
                  //  valueTextStyle: isGuest
                  //    ? AppTextStyles.styleBold16(context).copyWith(
                  //      color: const Color(0xff555555),
                  //  )
                  // : null,
                ),
              ),

              SizedBox(width: SizeConfig.w(6)),

              /// ✅ completed tasks
              Expanded(
                child: MetricCard(
                  icon: Icons.task_alt,
                  iconColor: const Color(0xff00B4D8),
                  label: 'مهام مكتملة',
                  value:
                      // isGuest
                      //   ? "لا يوجد"
                      //  :
                      toArabicNumbers(completedTasks.toString()),
                  //valueTextStyle: isGuest
                  //  ? AppTextStyles.styleBold16(context).copyWith(
                  //    color: const Color(0xff555555),
                  // )
                  // : null,
                ),
              ),
            ],
          );
        }
        if (state is UserDetailsLoading || state is UsersInitial) {
          return const TechInfoCardRowShimmer();
        }

        if (state is UserDetailsError) {
          return const Center(child: ErrorText(message: "فشل تحميل البيانات"));
        }
        return const SizedBox(); // 👈 دي مهمة جدًا
      },
    );
    //  },
    // );
  }
}
