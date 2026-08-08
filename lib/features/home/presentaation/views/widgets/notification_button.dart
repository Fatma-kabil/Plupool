import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/notifications/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:plupool/features/notifications/presentation/manager/notification_cubit/notification_state.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      buildWhen: (previous, current) => current is GetUnreadCountSuccess,
      builder: (context, state) {
        final cubit = context.read<NotificationCubit>();

        return GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  offset: Offset(0, 1),
                  blurRadius: 1,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(6),
              vertical: SizeConfig.h(6),
            ),
            child: Badge(
              isLabelVisible: cubit.unreadCount > 0,
              label: Text(toArabicNumbers(cubit.unreadCount.toString())),
              child: Icon(Icons.notifications_outlined, size: SizeConfig.w(20)),
            ),
          ),
        );
      },
    );
  }
}
