import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/customers/presentation/manager/user_pool_cubit/user_pool_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/user_pool_cubit/user_pool_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/projects_view_header_shimmer.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/pool_info_card.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/section_header.dart';

class CustomerProfileViewMiddleCard extends StatefulWidget {
  const CustomerProfileViewMiddleCard({super.key, required this.userId});
  final int userId;

  @override
  State<CustomerProfileViewMiddleCard> createState() =>
      _CustomerProfileViewMiddleCardState();
}

class _CustomerProfileViewMiddleCardState
    extends State<CustomerProfileViewMiddleCard> {
  @override
  void initState() {
    super.initState();

    // 🔥 API REQUEST
    Future.microtask(() {
      context.read<PoolCubit>().getPool(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoolCubit, PoolState>(
      builder: (context, state) {
        // 🔄 LOADING
        if (state.isLoading) {
          return const ProjectsViewHeaderShimmer();
        }

        // ❌ ERROR
        if (state.error != null) {
          return Center(
            child: ErrorText(message: "حدث خطأ أثناء تحميل البيانات"),
          );
        }

        final pool = state.data;

        // ⚠️ EMPTY STATE
        if (pool == null) {
          return const ErrorText(message: "لا توجد بيانات حمام السباحة");
        }

        return Column(
          children: [
            Row(
              children: [
                const SectionHeader(
                  icon: Icons.pool_outlined,
                  title: "معلومات حمام السباحة",
                ),
                const Spacer(),

                // ✏️ EDIT BUTTON (sending data)
                GestureDetector(
                  onTap: () {
                    context.push(
                      '/editcustomerpoolinfo',
                      extra: {
                        "userId": widget.userId,
                        "pool": pool,
                        "cubit": context.read<PoolCubit>(),
                      },
                    );
                  },
                  child: Text(
                    "تعديل",
                    style: AppTextStyles.styleBold16(context).copyWith(
                      color: AppColors.kprimarycolor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(18)),

            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PoolInfoCard(
                    title: "النوع",
                    value: pool.poolTypeName ?? "غير متوفر",
                    color: const Color(0xFFCDF7EC),
                    iconcolor: const Color(0xff06D6A0),
                    icon: Icons.pool,
                  ),
                ),

                SizedBox(width: SizeConfig.w(8)),

                Expanded(
                  child: PoolInfoCard(
                    title: "الأبعاد",
                    value:
                        pool.lengthMeters != null &&
                            pool.widthMeters != null &&
                            pool.depthMeters != null
                        ? "${pool.lengthMeters}م × ${pool.widthMeters}م × ${pool.depthMeters}م"
                        : "غير متوفر",
                    color: const Color(0xFFCCE4F0),
                    iconcolor: const Color(0xff2B8EC2),
                    icon: Icons.straighten,
                  ),
                ),

                SizedBox(width: SizeConfig.w(8)),

                Expanded(
                  child: PoolInfoCard(
                    title: "الحجم",
                    value: pool.volumeLiters != null
                        ? "${pool.volumeLiters} لتر"
                        : "غير متوفر",
                    color: const Color(0xFFFFECD2),
                    iconcolor: const Color(0xffFF9F1C),
                    icon: Icons.square_foot,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
