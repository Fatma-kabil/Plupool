import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/features/consruction_service/data/models/pool_model.dart';
import 'package:plupool/features/consruction_service/data/models/pool_reservation_model.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/pool_construct_reservation_form.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/pool_reserved_header_card.dart';

class ReserveConstructionView extends StatelessWidget {
  final PoolModel pool;
  final void Function(PoolReservation reservation)? onConfirm;

  const ReserveConstructionView({super.key, required this.pool, this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(20) ,vertical:SizeConfig.h(20) ),
          child: ListView(
            children: [
             
              PoolReserveHeaderCard(
                title: pool.title,
                description: pool.description,
              ),
              const SizedBox(height: 15),
              Text(
                '*املأ النموذج للتواصل وحجز موعد انشاء حمام السباحة الخاص بك',
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleRegular16(context)
                    .copyWith(color: AppColors.kprimarycolor),
              ),
              const SizedBox(height: 12),
              PoolReservationForm(onConfirm: onConfirm,poolTitle: pool.title,),
              const SizedBox(height: 28),
              CustomOutlinedBtn(
                text: "إلغاء",
                width: double.infinity,
                trailing: Icon(
                  Icons.cancel_outlined,
                  color: AppColors.kprimarycolor,
                  size: SizeConfig.w(18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
