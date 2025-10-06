// 👇 محتوى تبويب "خدمة الصيانة"
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/booking_card.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
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
          MaintenancePoolsList(),

          CustomTextBtn(
            text: 'احجز الان',
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => BookingCard(
                  onConfirm: (date, time) {
                    Navigator.pop(context); // يقفل الدايالوج بعد التأكيد
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
