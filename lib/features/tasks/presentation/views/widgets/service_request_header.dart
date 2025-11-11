import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_data_time_row.dart';

class ServiceRequestHeader extends StatelessWidget {
  const ServiceRequestHeader({
    super.key,

    required this.stutscolor,

    required this.textcolor,
    required this.request,
  });

  final Color stutscolor;
  final ServiceRequest request;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              request.title,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            SizedBox(height: SizeConfig.h(4)),
            BuildDataTimeRow(request: request),
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(10),
            vertical: SizeConfig.h(4),
          ),
          decoration: BoxDecoration(
            color: stutscolor,
            borderRadius: BorderRadius.circular(SizeConfig.w(5)),
          ),
          child: Text(
            getStatusText(request.status),
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: textcolor),
          ),
        ),
      ],
    );
  }
}
