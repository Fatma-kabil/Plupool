import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/widgets/header_text.dart';
import 'package:plupool/core/utils/widgets/success_image.dart';

class DoneCard extends StatelessWidget {
  const DoneCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 43),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SuccessImage(),
            SizedBox(height: 61,),
            HeaderText(
              title: 'تم استلام طلبك بنجاح!!',
              subtitle:
                  'سيقوم فريقنا بالتواصل معك في الوقت الذي اخترته. \nشكراً لاستخدامك PluPool',
            ),
          ],
        ),
      ),
    );
  }
}
