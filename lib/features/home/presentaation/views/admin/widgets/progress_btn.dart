import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';

import 'package:plupool/features/packages/presentation/manager/package_cubit/package_cubit.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_state.dart';

import 'package:plupool/features/store/presentation/views/widgets/Qty_Btn.dart';

class ProgressBtn extends StatelessWidget {
  const ProgressBtn({
    super.key,
    required this.status,
    required this.packageId,
    required this.bookingId,
  });

  final RequestStatus status;
  final int packageId;
  final int bookingId;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.watch<PackagesCubit>().state is PackagesActionLoading;

    // =========================
    // ➕ INCREASE
    // =========================

    final bool canIncrease = !isLoading;

    // =========================
    // ➖ DECREASE
    // =========================

    final bool canDecrease = !isLoading;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // =========================
        // ➕ INCREASE
        // =========================

        QtyBtn(
          icon: isLoading ? null : Icons.add,
          backgroundcolor: canIncrease
              ? const Color(0xff2B8EC2)
              : const Color(0xffCDCDCD),
          onTap: canIncrease
              ? () {
                  print("🟢 INCREASE CLICKED");
                  print("packageId = $packageId");
                  print("bookingId = $bookingId");

                  context.read<PackagesCubit>().increaseProgress(
                        packageId: packageId,
                        bookingId: bookingId,
                      );
                }
              : null,
          child: isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : null,
        ),

        // =========================
        // TEXT
        // =========================

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(8),
          ),
          child: Text(
            "تحديث التقدم",
            style: AppTextStyles.styleRegular12(
              context,
            ).copyWith(
              color: AppColors.ktextcolor,
            ),
          ),
        ),

        // =========================
        // ➖ DECREASE
        // =========================

        QtyBtn(
          icon: Icons.remove,
          backgroundcolor: canDecrease
              ? const Color(0xffCDCDCD)
              : const Color(0xffCDCDCD),
          onTap: canDecrease
              ? () {
                  print("🔴 DECREASE CLICKED");
                  print("packageId = $packageId");
                  print("bookingId = $bookingId");

                  context.read<PackagesCubit>().decreaseProgress(
                        packageId: packageId,
                        bookingId: bookingId,
                      );
                }
              : null,
        ),
      ],
    );
  }
}