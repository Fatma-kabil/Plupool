import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/card_footer_button.dart';

class ServiceCardFooter extends StatelessWidget {
  const ServiceCardFooter({super.key});

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
            onTap: () {
              context.push('/editcustomerserviceview');
            },
          ),
          CardFooterButton(
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
