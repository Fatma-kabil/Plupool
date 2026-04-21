import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/presentation/manager/cubits/booking_cubit.dart';
import 'package:plupool/features/services/presentation/manager/cubits/booking_state.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/date_row.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/service_card_footer.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/service_card_row.dart';

class CustomerServiceCard extends StatelessWidget {
  const CustomerServiceCard({super.key, required this.booking});
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    final status = mapApiStatus(booking.status);
    final colors = RequestStatusColors.getColors(status);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        color: colors['bg'],
        border: Border.all(color: colors['border']),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- العنوان و الحالة ----
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "طلب رقم #${booking.userName}",
                      style: AppTextStyles.styleBold16(
                        context,
                      ).copyWith(color: Color(0xff333333)),
                    ),

                    buildStatusLabel(colors, context, status),
                  ],
                ),
                //   SizedBox(height: 8),
                DateRow(date: booking.date),
              ],
            ),

            const SizedBox(height: 12),

            ServiceCardRow(title: "نوع الخدمة:", value: booking.bookingType),
            const SizedBox(height: 5),
            ServiceCardRow(title: " العميل:", value: booking.userName),
            const SizedBox(height: 5),
            ServiceCardRow(
              title: "الفنيين:",
              value: booking.technicians.join(" - "),
            ),
            const SizedBox(height: 8),
            ServiceCardFooter(delFun: () {
               showDialog(
                    context: context,
                    builder: (dialogContext) {
                       final cubit = context.read<BookingCubit>();
                      return BlocConsumer<BookingCubit, BookingState>(
                           bloc: cubit, 
                        listener: (context, state) {
                          if (state is BookingDeleted) {
                            Navigator.pop(context);

                            showCustomSnackBar(
                              context: context,
                              message: "تم حذف الطلب بنجاح 🗑️",
                              isSuccess: true,
                            );
                          }

                          if (state is BookingError) {
                            Navigator.pop(context);

                            showCustomSnackBar(
                              context: context,
                              message: state.message,
                            );
                          }
                        },
                        builder: (context, state) {
                        
                          final isLoading = state is BookingLoading;

                          return DeleteOrderCard(
                            text: "هل أنت متأكد من حذف هذا الطلب؟",
                            isLoading: isLoading,
                            onPressed: isLoading
                                ? null
                                : () {
                                    cubit.deleteBooking(booking.id);
                                  },
                          );
                        },
                      );
                    },
                  );
                },
            ),
            // ---- بيانات المستخدم + زرار الموقع ----
          ],
        ),
      ),
    );
  }
}
