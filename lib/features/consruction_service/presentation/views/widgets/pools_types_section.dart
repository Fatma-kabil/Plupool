import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/pool_types_cubit/pool_types_cubit.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/pool_types_cubit/pool_types_state.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/pool_card_shimmer.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/pool_list.dart';

class PoolsTypesSection extends StatelessWidget {
  const PoolsTypesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoolTypesCubit, PoolTypesState>(
      builder: (context, state) {
        if (state is PoolTypesLoading) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (_, __) => SizedBox(height: SizeConfig.h(22)),
            itemBuilder: (_, __) => const PoolCardShimmer(),
          );
        }

        if (state is PoolTypesFailure) {
          return ErrorText(message: state.message);
        }

        if (state is PoolTypesSuccess) {
          if (state.poolTypes.isEmpty) {
            return Center(
              child: ErrorText(message: 'لا توجد أنواع حمامات متاحة حالياً'),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أنواع الحمامات المتاحة',
                style: AppTextStyles.styleSemiBold20(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              const SizedBox(height: 10),
              PoolsList(poolTypes: state.poolTypes),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
