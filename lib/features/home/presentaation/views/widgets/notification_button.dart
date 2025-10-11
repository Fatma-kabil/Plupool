
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/utils/size_config.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key, this.onTap,
  });

final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(5) , vertical: SizeConfig.h(6)),
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
              width: SizeConfig.w(19),
              height: SizeConfig.w(19),
            ),
          ),
        ),
      ),
    );
  }
}




