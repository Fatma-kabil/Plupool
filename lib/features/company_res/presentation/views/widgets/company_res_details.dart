import 'package:flutter/material.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info_item.dart';

class CompanyResDetails extends StatelessWidget {
  const CompanyResDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CustomerInfoItem(
          icon: Icons.calendar_month_outlined,
          title: "تاريخ الانضمام",
          value: "20/12/2025",
        ),
        CustomerInfoItem(
          icon: Icons.home_work_outlined,
          title: "اسم الشركة",
          value: "شركة التنقيه",
        ),
      ],
    );
  }
}
