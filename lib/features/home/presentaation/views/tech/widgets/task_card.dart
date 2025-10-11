import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/open_location.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_data_time_row.dart';

class TeskCard extends StatelessWidget {
  final ServiceRequest request;
  const TeskCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(request.status);
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(10)),
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
          //  crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                buildStatusLabel(colors, context, request.status),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      request.title,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                    const SizedBox(height: 4),
                    BuildDataTimeRow(request: request),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage(request.userImage),
                ),
                const SizedBox(width: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      request.userName,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Color(0xff555555)),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        const SizedBox(width: 3),
                        Text(
                          request.location,
                          style: AppTextStyles.styleRegular13(
                            context,
                          ).copyWith(color: Color(0xff999999)),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap:() => openLocation(request) ,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colors['labelText']),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.w(14),
                        vertical: SizeConfig.h(6),
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                      
                          
                  
                             Icon(
                              Icons.location_on,
                              color: colors['labelText'],
                              size: SizeConfig.w(16),
                            ),
                          
                          Text(
                            'الموقع',
                            style: AppTextStyles.styleSemiBold16(
                              context,
                            ).copyWith(color: colors['labelText']),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
