import 'package:flutter/material.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info_item.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key});

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
          icon: Icons.location_on,
          title: "العنوان",
          value: "مدينة نصر ، القاهرة",
        ),
      ],
    );
  }
}
