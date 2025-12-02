import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/booking_card.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/confirm_package_booking_card.dart';

class EndCardTask extends StatelessWidget {
  const EndCardTask({super.key, required this.request});
  final ServiceRequest request;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.w(14)),
      decoration: BoxDecoration(
        //     color: Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                request.packageType ?? "",
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              Spacer(),
              Text(
                "البدايه: ",
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              Text(
                request.date,
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(15),
              vertical: SizeConfig.h(4),
            ),
            decoration: BoxDecoration(
              color: Color(0xffD6D6D6),
              borderRadius: BorderRadius.circular(SizeConfig.w(5)),
            ),
            child: Text(
              "منتهية",
              style: AppTextStyles.styleSemiBold13(
                context,
              ).copyWith(color: Color(0xffBBBBBB)),
            ),
          ),
          SizedBox(height: SizeConfig.h(8)),
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                size: SizeConfig.w(12),
                color: Color(0xff999999),
              ),
              SizedBox(width: SizeConfig.w(4)),
              Text(
                'انتهت في: ',
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff999999)),
              ),
              Text(
                request.endTime ?? "",
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(12)),
          CustomTextBtn(
            text: "تجديد الباقه",
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
              child: ConfirmPackageBookingCard(
                date: date,
                time: time,
                packageType:request.packageType!,
              ),
            ),
          );
        },
      ),
    );
            },
            width: double.infinity,
            textStyle: AppTextStyles.styleBold16(
              context,
            ).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
