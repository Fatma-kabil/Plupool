import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';
class MaintenanceCardFooter extends StatelessWidget {
  const MaintenanceCardFooter({
    super.key,
    required this.sourceBookingId,
    required this.visit,
    required this.reading,
  });

  final int sourceBookingId;
  final PackageVisitEntity visit;
  final ReadingEntity? reading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            context.push(
              '/editcompletedvisitview',
              extra: {
                'sourceBookingId': sourceBookingId,
                'visit': visit,
                'reading': reading,
              },
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
                  ? SizeConfig.w(17)
                  : SizeConfig.w(20),
            ),
          ),
        ),
      ],
    );
  }
}