// lib/features/services/presentation/views/widgets/reservation_details_dialog.dart
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/features/services/data/models/pool_reservation_model.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class ReservationDetailsDialog extends StatelessWidget {
  final PoolReservation reservation;

  const ReservationDetailsDialog({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      contentPadding: EdgeInsets.only(left: 10, right: 10),
      titlePadding: EdgeInsets.only(left: 8, right: 8, top: 35,bottom: 18),
      backgroundColor: AppColors.kScaffoldColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffD4D4D4)),
        ),
        child: Center(
          child: Text(
            '  تفاصيل الحجز  ',
            style: AppTextStyles.styleBold20(
              context,
            ).copyWith(color: Colors.black),
          ),
        ),
      ),
      content: Container(
         width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xff003C48)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildDetail("اسم الحمام:", reservation.title, context),
            _buildDetail(
              "التاريخ:",
              reservation.date != null
                  ? "${reservation.date!.toLocal()}".split(' ')[0]
                  : "غير محدد",
              context,
            ),
            _buildDetail(
              "الوقت:",
              reservation.time != null
                  ? reservation.time!.format(context)
                  : "غير محدد",
              context,
            ),
            _buildDetail("العرض:", "${reservation.width} متر", context),
            _buildDetail("الارتفاع:", "${reservation.height} متر", context),
            _buildDetail("العمق:", "${reservation.depth} متر", context),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("إغلاق"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _buildDetail(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        "$label $value",
        style: AppTextStyles.styleRegular13(context),
        textAlign: TextAlign.right,
      ),
    );
  }
}
