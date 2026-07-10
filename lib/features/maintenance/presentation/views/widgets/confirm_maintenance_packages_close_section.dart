import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/done_card.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_package_cubit/maintenance_packag_state.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_package_cubit/maintenance_package_cubit.dart';

class ConfirmMaintenancePackagesCloseSection extends StatelessWidget {
  const ConfirmMaintenancePackagesCloseSection({super.key, this.date, this.time, required this.packageId, });
  final DateTime? date;
  final TimeOfDay? time;
  final int packageId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaintenancePackagesCubit, MaintenancePackagesState>(
      listener: (context, state) {
        if (state is MaintenancePackageBookingSuccess) {
          Navigator.of(context).pop(); // يقفل Dialog التفاصيل
          Navigator.of(context).pop(); // يقفل صفحة الفورم

          showDialog(context: context, builder: (_) => const DoneCard());
        }

        if (state is MaintenancePackageBookingError) {
          Navigator.of(context).pop();
          Navigator.of(context).pop(); // يقفل Dialog التفاصيل

          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: false,
          );
        }
      },
      builder: (context, state) {
        return Row(
          textDirection: TextDirection.rtl,
          children: [
            CustomTextBtn(
              text: "تأكيد الحجز",
              isLoading: state is MaintenancePackageBookingLoading,
              padding: SizeConfig.w(8),
              onPressed: state is MaintenancePackageBookingLoading
                  ? null
                  : () {
                     print("Package Id => $packageId");
                      context.read<MaintenancePackagesCubit>().bookPackage(
                        bookingType:  "maintenance_package",
  
                bookingDate:
                    "${date?.year}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
                bookingTime:
                    "${time?.hour.toString().padLeft(2, '0')}:${time?.minute.toString().padLeft(2, '0')}:00",
                    packageId: packageId
                       
                      );
                    },
            ),
          
            const Spacer(),
            CustomOutlinedBtn(
              text: "تعديل",
              trailing: Icon(
                Icons.edit_note_sharp,
                color: AppColors.kprimarycolor,
                size: SizeConfig.h(24),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
