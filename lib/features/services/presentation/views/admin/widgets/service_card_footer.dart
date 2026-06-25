import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/presentation/manager/user_booking_cubit/user_booking_cubit.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/card_footer_button.dart';

class ServiceCardFooter extends StatelessWidget {
  const ServiceCardFooter({super.key, this.delFun, required this.booking});
  final void Function()? delFun;
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardFooterButton(
            color: Color(0xffCCF0F7),
            icon: Icons.edit_note,
            text: "تعديل",
            textColor: Color(0xff0077B6),
            onTap: () async {
              final result = await context.push(
                '/editcustomerserviceview',
                extra: booking,
              );

              print('RESULT = $result');

              if (result == true) {
                print('REFRESHING...');
                context.read<UserBookingCubit>().refresh();
              }
            },
          ),
          CardFooterButton(
            onTap: delFun,
            color: Color(0xffFAD7DA),
            icon: Icons.delete_outline_outlined,
            text: "حذف الطلب",
            textColor: Color(0xffE63946),
          ),
        ],
      ),
    );
  }
}
