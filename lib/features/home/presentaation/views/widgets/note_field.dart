
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class NoteField extends StatelessWidget {
  const NoteField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🟢 الصندوق الأساسي
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.textFieldBorderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            maxLines: 5,
            textAlign: TextAlign.right,
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
                  SizedBox(width: 4),
                  SvgPicture.asset('assets/icons/notes.svg'),
                ],
              ),
    
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8),
            ),
          ),
        ),
    
        // 🟢 الأيقونة في الأسفل يسار
        Positioned(
          bottom: 2,
          left: 2,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.attach_file,
              color: Color(0xffBBBBBB),
              size: SizeConfig.w(24),
            ),
          ),
        ),
      ],
    );
  }
}
