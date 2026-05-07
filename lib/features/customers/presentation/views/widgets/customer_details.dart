import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info_item.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key, required this.date, required this.location});
  final DateTime date;
  final String location;

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
          icon: Icons.location_on,
          title: "العنوان",
          value: location,
        ),
      ],
    );
  }
}
