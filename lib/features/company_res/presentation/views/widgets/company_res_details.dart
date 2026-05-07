import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info_item.dart';

class CompanyResDetails extends StatelessWidget {
  const CompanyResDetails({super.key,this.companyName,required this. date});
final String? companyName;
final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        CustomerInfoItem(
          icon: Icons.calendar_month_outlined,
          title: "تاريخ الانضمام",
          value:formatDate(date),
        ),
        CustomerInfoItem(
          icon: Icons.home_work_outlined,
          title: "اسم الشركة",
          value: companyName??"لا يوجد",
        ),
      ],
    );
  }
}
