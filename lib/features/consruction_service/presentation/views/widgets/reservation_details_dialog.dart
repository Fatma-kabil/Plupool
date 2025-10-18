import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/data/models/pool_reservation_model.dart';
import 'package:plupool/core/utils/widgets/close_section.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/dimentions_section.dart';
import 'details_header.dart';
import 'pool_type_section.dart';
import '../../../../../core/utils/widgets/date_time_section.dart';

class ReservationDetailsDialog extends StatelessWidget {
  final PoolReservation reservation;

  const ReservationDetailsDialog({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:  EdgeInsets.only(left:SizeConfig.w(10) , right: SizeConfig.w(10), top: SizeConfig.h(35)),
      backgroundColor: AppColors.kScaffoldColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(20),vertical: SizeConfig.h(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DetailsHeader(),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(vertical:SizeConfig.h(10) , horizontal: SizeConfig.w(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: const Color(0xff003C48)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  PoolTypeSection(title: reservation.title),
                  const SizedBox(height: 20),
                  DateTimeSection(date: reservation.date,time: reservation.time,),
                  const SizedBox(height: 20),
                  DimensionsSection(reservation: reservation),
                  const SizedBox(height: 20),
                  const CloseSection(),
                   const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
