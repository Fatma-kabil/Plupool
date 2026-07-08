import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/booking_card.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/error_card.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_cubit/maintenance_cubit.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_cubit/maintenance_state.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/confirm_maintenance_booking card.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/maintenance_pool_list_shimmer.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/maintenance_pools_list.dart';

class MaintenanceSection extends StatelessWidget {
  const MaintenanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceCubit, MaintenanceState>(
      builder: (context, state) {
        if (state is MaintenanceLoading) {
          return const MaintenancePoolsListShimmer();
        }

        if (state is MaintenanceError) {
          return Center(child: ErrorText(message: state.message));
        }

        if (state is MaintenanceLoaded) {
          final service = state.service;

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "خدمة الصيانه تشمل : ",
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.styleSemiBold18(
                        context,
                      ).copyWith(color: Colors.black),
                    ),

                    const SizedBox(height: 20),

                    MaintenancePoolsList(sections: service.sections),

                    const SizedBox(height: 100),
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: SizeConfig.h(8)),
                    child:
                        // BlocBuilder<AuthCubit, AuthState>(
                        // builder: (context, authState) {
                        // return
                        CustomTextBtn(
                          text: 'احجز الآن',
                          width: double.infinity,
                          onPressed: () {
                            // if (authState.status == AuthStatus.guest) {
                            //   showDialog(
                            //     context: context,
                            //     builder: (_) => ErrorCard(
                            //       title: 'لم يتم تسجيل الدخول',
                            //       subtitle:
                            //           'لتستمتع بتجربتك وتتابع خدماتك، قم بتسجيل الدخول أولاً.',
                            //       color: Colors.white,
                            //     ),
                            //   );
                            // } else {
                            showDialog(
                              context: context,
                              builder: (_) => BookingCard(
                                onConfirm: (date, time) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      insetPadding: const EdgeInsets.all(16),
                                      child: ConfirmMaintenanceBookingCard(
                                        date: date,
                                        time: time,
                                        bookingtype: service.bookingType,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                            // }
                          },
                        ),
                    // },
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
