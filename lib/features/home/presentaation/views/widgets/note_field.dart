import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class NoteField extends StatelessWidget {
  final TextEditingController controller;

  const NoteField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) {
        // ✅ هنا تستدعي الفاليديتور من فايل الفاليديت
        if (controller.text.trim().isEmpty) {
          return "من فضلك اكتب ملاحظاتك";
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: field.hasError
                          ? Colors
                                .red // ✅ البوردر يبقى أحمر لو فيه خطأ
                          : AppColors.textFieldBorderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: controller,
                    maxLines: 5,
                    textAlign: TextAlign.right,
                    onChanged: (val) => field.didChange(val),
                    decoration: InputDecoration(
                      hint: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'أكتب ملاحظاتك هنا.....',
                            style: AppTextStyles.styleRegular13(
                              context,
                            ).copyWith(color: AppColors.hintTextColor),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset('assets/icons/notes.svg'),
                        ],
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(8),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 2,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.attach_file,
                      color: const Color(0xffBBBBBB),
                      size: SizeConfig.w(24),
                    ),
                  ),
                ),
              ],
            ),

            // ✅ الرسالة تظهر تحت الكونتينر
            if (field.hasError)
              Align(
                alignment: Alignment.centerRight, // ✅ يلزق النص على اليمين
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 8),
                  child: Text(
                    field.errorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl, // ✅ اتجاه عربي
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
