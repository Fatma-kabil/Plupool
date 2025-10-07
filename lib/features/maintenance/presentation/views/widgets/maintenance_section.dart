import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/booking_card.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/confirm_maintenance_booking%20card.dart';

import 'package:plupool/features/maintenance/presentation/views/widgets/maintenance_pools_list.dart';

class MaintenanceSection extends StatelessWidget {
  const MaintenanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 10),
          Text(
            textDirection: TextDirection.rtl,
            'خدمة الصيانة تشمل:',
            style: AppTextStyles.styleSemiBold20(
              context,
            ).copyWith(color: Colors.black),
          ),
          const SizedBox(height: 20),
          const MaintenancePoolsList(),
          CustomTextBtn(
            text: 'احجز الآن',
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => BookingCard(
                  onConfirm: (date, time) {
                    // بعد التأكيد نعرض كارت تأكيد الحجز
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
            width: double.infinity,
          ),
          const SizedBox(height: 27),
        ],
      ),
    );
  }
}
