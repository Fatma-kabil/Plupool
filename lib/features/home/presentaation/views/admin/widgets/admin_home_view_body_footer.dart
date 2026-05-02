import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/admin_packaes_card.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_cubit.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_state.dart';
import 'package:plupool/features/packages/presentation/views/widgets/packages_shimmer_list.dart';

class AdminHomeViewBodyFooter extends StatelessWidget {
  const AdminHomeViewBodyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'الباقات الجارية',
              style: AppTextStyles.styleSemiBold18(context),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => context.push('/seeallpackagesview'),
              child: Text(
                'عرض الكل',
                style: AppTextStyles.styleSemiBold18(context).copyWith(
                  color: AppColors.kprimarycolor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.kprimarycolor, // لون الخط زي النص
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.h(15)),
        BlocBuilder<PackagesCubit, PackagesState>(
          builder: (context, state) {
            /// 🔄 Loading
            if (state is PackagesLoading) {
              return const PackagesShimmerList();
            }

            /// ❌ Error
            if (state is PackagesError) {
              return Center(child: ErrorText( message:  state.message));
            }

            /// ✅ Success
            if (state is PackagesSuccess) {
              final packages = state.response.packages;

              final filtered = packages
                  .where((e) => e.status == "in_progress")
                  .toList();

              if (filtered.isEmpty) {
                return const Center(child: ErrorText(message: "لا توجد باقات جارية"));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  return AdminPackaesCard(request: filtered[index]);
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
