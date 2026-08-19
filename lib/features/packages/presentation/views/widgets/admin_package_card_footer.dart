import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';

import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';

import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_state.dart';

import 'package:plupool/features/services/presentation/manager/user_booking_cubit/user_booking_cubit.dart';

class AdminPackageCardFooter extends StatelessWidget {
  const AdminPackageCardFooter({
    super.key,
    required this.model,
  });

  final UserBookingEntity model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // ============================================================
        // EDIT
        // ============================================================
        GestureDetector(
          onTap: () {
            context.push(
              '/editpackageview',
              extra: model,
            );
          },
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(6)),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffCCF0F7),
            ),
            child: Icon(
              Icons.edit_note_outlined,
              color: AppColors.kprimarycolor,
              size: SizeConfig.isWideScreen
                  ? SizeConfig.w(18)
                  : SizeConfig.w(20),
            ),
          ),
        ),

        SizedBox(width: SizeConfig.w(12)),

        // ============================================================
        // DELETE
        // ============================================================
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (dialogContext) {
                final bookingCubit = context.read<BookingCubit>();

                return BlocConsumer<BookingCubit, BookingState>(
                  bloc: bookingCubit,

                  // ==================================================
                  // LISTENER
                  // ==================================================
                  listener: (context, state) async {
                    // ================================================
                    // SUCCESS
                    // ================================================
                    if (state is BookingDeleted) {
                      Navigator.pop(dialogContext);

                      // Refresh User Bookings
                      await context
                          .read<UserBookingCubit>()
                          .refresh();

                      showCustomSnackBar(
                        context: context,
                        message: "تم حذف الحجز بنجاح 🗑️",
                        isSuccess: true,
                      );
                    }

                    // ================================================
                    // ERROR
                    // ================================================
                    if (state is BookingError) {
                      Navigator.pop(dialogContext);

                      // Refresh User Bookings even after error
                      await context
                          .read<UserBookingCubit>()
                          .refresh();

                      showCustomSnackBar(
                        context: context,
                        message: state.message,
                        isSuccess: false,
                      );
                    }
                  },

                  // ==================================================
                  // BUILDER
                  // ==================================================
                  builder: (context, state) {
                    final isLoading = state is BookingLoading;

                    return DeleteOrderCard(
                      text: "هل أنت متأكد من حذف هذه الباقة؟",
                      isLoading: isLoading,
                      onPressed: isLoading
                          ? null
                          : () {
                              bookingCubit.deleteBooking(model.id);
                            },
                    );
                  },
                );
              },
            );
          },

          // ==========================================================
          // DELETE ICON
          // ==========================================================
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(6)),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFAD7DA),
            ),
            child: Icon(
              Icons.delete_outline_rounded,
              color: const Color(0xffE63946),
              size: SizeConfig.isWideScreen
                  ? SizeConfig.w(18)
                  : SizeConfig.w(22),
            ),
          ),
        ),
      ],
    );
  }
}