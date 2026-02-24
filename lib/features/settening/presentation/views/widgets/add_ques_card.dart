
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/settening/presentation/views/widgets/add_edit_ques_form.dart';
class AddQuesCard extends StatefulWidget {
  const AddQuesCard({super.key});

  @override
  State<AddQuesCard> createState() => _AddQuesCardState();
}

class _AddQuesCardState extends State<AddQuesCard> {
  final formKey = GlobalKey<FormState>();

  final questionController = TextEditingController();
  final answerController = TextEditingController();
  final orderController = TextEditingController();

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    orderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(20),
          vertical: SizeConfig.h(29),
        ),
        child: Container(
          width: SizeConfig.isWideScreen
              ? SizeConfig.screenWidth * 0.85
              : double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(20),
            vertical: SizeConfig.h(25),
          ),
          decoration: BoxDecoration(
            color: AppColors.kScaffoldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AddEditQuesForm(
                  formKey: formKey,
                  questionController: questionController,
                  answerController: answerController,
                  orderController: orderController,
                ),
            
                const SizedBox(height: 30),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextBtn(
                      text: "إضافة",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      },
                      padding: SizeConfig.isWideScreen ? 12 : 7,
                      width: SizeConfig.w(120),
                      textStyle: AppTextStyles.styleBold16(context)
                          .copyWith(color: Colors.white),
                      trailing: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: SizeConfig.w(15),
                      ),
                    ),
            
                    CustomOutlinedBtn(
                      text: 'إلغاء',
                      onPressed: () => Navigator.pop(context),
                      trailing: Icon(
                        Icons.cancel_outlined,
                        color: AppColors.kprimarycolor,
                        size: SizeConfig.w(15),
                      ),
                      width: SizeConfig.w(120),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}