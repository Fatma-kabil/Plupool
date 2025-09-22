import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_back_button.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/customer_construct_card.dart';

class CustomerConstructView extends StatelessWidget {
  const CustomerConstructView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const CustomBackButton(),
          const SizedBox(height: 25),

          // ✅ البطاقة
          CustomerConstructCard(),
        ],
      ),
    );
  }
}
