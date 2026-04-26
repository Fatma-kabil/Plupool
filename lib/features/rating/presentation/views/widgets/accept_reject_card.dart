import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class AcceptRejectCard extends StatelessWidget {
  const AcceptRejectCard({
    super.key,
   required this.text,
    this.onPressed,
    this.isLoading = false,
   required this.subTitle,
  });
  final String text;
  final void Function()? onPressed;
  final bool isLoading;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(20),
          vertical: SizeConfig.h(35),
        ),
        child: Container(
          width: SizeConfig.isWideScreen
              ? SizeConfig.screenWidth * 0.65
              : double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(16),
            vertical: SizeConfig.h(20),
          ),
          decoration: BoxDecoration(
            color: AppColors.kScaffoldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                text ,
                style: AppTextStyles.styleBold18(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
                SizedBox(height: SizeConfig.h(18)),
               Text(
                textAlign: TextAlign.center,
                subTitle ,
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Color(0xff777777)),
              ),
              SizedBox(height: SizeConfig.h(50)),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0077B6),
                        disabledBackgroundColor: const Color(
                          0xff0077B6,
                        ).withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: isLoading ? null : onPressed,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.isWideScreen
                              ? SizeConfig.h(8)
                              : 0,
                        ),
                        child: Text(
                          "تأكيد",
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.w(22)),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xff0077B6)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.isWideScreen
                              ? SizeConfig.h(8)
                              : 0,
                        ),
                        child: Text(
                          "إلغاء",
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: const Color(0xff0077B6)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
