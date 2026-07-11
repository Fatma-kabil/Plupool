import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    this.onPressed,
    this.tittle,
    this.icon,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final String? tittle;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.h(46),
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? SizedBox(
                width: SizeConfig.w(18),
                height: SizeConfig.w(18),
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Icon(
                icon ?? Icons.edit_document,
                color: Colors.white,
                size: SizeConfig.w(18),
              ),
        label: Text(
          isLoading ? "جاري الإرسال..." : (tittle ?? "تعديل المعلومات"),
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kprimarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}