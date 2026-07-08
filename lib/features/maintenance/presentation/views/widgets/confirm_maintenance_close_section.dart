import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/construction_booking_cubit/construction_booking_state.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/done_card.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_booking_params.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_cubit/maintenance_cubit.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_cubit/maintenance_state.dart';

class ConfirmMaintenanceCloseSection extends StatelessWidget {
  const ConfirmMaintenanceCloseSection({super.key, required this.reservation});

final MaintenanceBookingEntity reservation;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaintenanceCubit, MaintenanceState>(
      listener: (context, state) {
        if (state is MaintenanceBookingSuccess) {
          Navigator.of(context).pop(); // يقفل Dialog التفاصيل
          Navigator.of(context).pop(); // يقفل صفحة الفورم

          showDialog(context: context, builder: (_) => const DoneCard());
        }

        if (state is MaintenanceBookingError) {
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
              isLoading: state is ConstructionBookingLoading,
              padding: SizeConfig.w(8),
              onPressed: state is ConstructionBookingLoading
                  ? null
                  : () {
                      context.read<MaintenanceCubit>().bookMaintenance(
                        bookingType: reservation.bookingType,
                        bookingDate: reservation.bookingDate,
                        bookingTime: reservation.bookingTime,
                       
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
