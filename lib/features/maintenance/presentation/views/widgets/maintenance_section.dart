import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/booking_card.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/confirm_maintenance_booking%20card.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/maintenance_pools_list.dart';

class MaintenanceSection extends StatelessWidget {
  const MaintenanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 👇 المحتوى اللي بيتسكرول
        SingleChildScrollView(
      //    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                'خدمة الصيانة تشمل:',
                style: AppTextStyles.styleSemiBold20(context)
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(height: 20),
              const MaintenancePoolsList(),
              const SizedBox(height: 100), // مساحة تحت علشان الزرار ما يغطيش المحتوى
            ],
          ),
        ),

        /// 👇 الزرار الثابت في الأسفل داخل خلفية بيضاء بحد علوي + حواف دائرية
        Positioned(
          bottom: 0,
    //     bottom: SizeConfig.h(16),
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            decoration: BoxDecoration(
             color: Colors.white,
            ),
             
          child:  Padding(
              padding:  EdgeInsets.only(top:SizeConfig.h(8)),
              child: CustomTextBtn(
                text: 'احجز الآن',
                width: double.infinity,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => BookingCard(
                      onConfirm: (date, time) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.all(16),
                            child: ConfirmMaintenanceBookingCard(
                              date: date,
                              time: time,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}