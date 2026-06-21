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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QtyBtn(
          icon: isLoading ? null : Icons.add,
          backgroundcolor: status == RequestStatus.completed
              ? const Color(0xffCDCDCD)
              : const Color(0xff2B8EC2),
          onTap: isLoading
              ? null
              : () {
                  context.read<PackagesCubit>().updateProgress(
                        packageId: packageId,
                        bookingId: bookingId,
                      );
                },
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

        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
          child: Text(
            "تحديث التقدم",
            style: AppTextStyles.styleRegular12(
              context,
            ).copyWith(
              color: AppColors.ktextcolor,
            ),
          ),
        ),

        QtyBtn(
          icon: Icons.remove,
          backgroundcolor: status == RequestStatus.completed
              ? const Color(0xff06D6A0)
              : const Color(0xffCDCDCD),
          onTap: () {},
        ),
      ],
    );
  }
}