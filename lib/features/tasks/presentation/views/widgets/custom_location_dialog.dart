import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

Future<String?> showCustomLocationDialog(BuildContext context) async {
  final controller = TextEditingController();

  return showDialog<String>(
    context: context,
    useRootNavigator: true,
    builder: (dialogContext) {
      return AlertDialog(
       contentPadding: EdgeInsets.symmetric(vertical: SizeConfig.h(15),horizontal:SizeConfig.w(15) ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          "أدخل موقعك المخصص",
          textAlign: TextAlign.right,
          style: AppTextStyles.styleBold20(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        content: SizedBox(
            width: SizeConfig.screenWidth * 0.8,
          
          child: TextField(
            cursorColor: AppColors.ktextcolor,
            style: AppTextStyles.styleMedium16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
            controller: controller,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: "مثلاً: شارع التحرير - الدقي",
              hintStyle: AppTextStyles.styleRegular14(
                context,
              ).copyWith(color: Colors.grey[500]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10),
                 borderSide: BorderSide(color: AppColors.ktextcolor)
              )
            ),
          ),
        ),
        actions: [
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ مسافة كبيرة بينهم
            children: [
              
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(
                  "إلغاء",
                  style: AppTextStyles.styleBold16(
                    context,
                  ).copyWith(color: Colors.grey[700]),
                ),
              ),
              //  Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kprimarycolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  final location = controller.text.trim();
                  Navigator.pop(dialogContext, location);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(8),
                    vertical: SizeConfig.h(6),
                  ),
                  child: Text(
                    "تم",
                    style: AppTextStyles.styleBold16(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
