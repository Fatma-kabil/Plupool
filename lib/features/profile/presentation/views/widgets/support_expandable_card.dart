import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class SupportExpandableCard extends StatefulWidget {
  final String question;
  final Widget answer;

  SupportExpandableCard({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  State<SupportExpandableCard> createState() => _SupportExpandableCardState();
}

class _SupportExpandableCardState extends State<SupportExpandableCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // لون الظل
            offset: Offset(0, 2), // تحريك الظل للأسفل فقط
            blurRadius: 4, // نعومة الظل
            spreadRadius: 0, // انتشار الظل صفر عشان يكون خط رفيع
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(8),vertical: SizeConfig.h(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: AppTextStyles.styleMedium16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                  ),
                  AnimatedRotation(
                    duration: Duration(milliseconds: 250),
                    turns: isExpanded ? 0.5 : 0,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xffA4A4A4),
                      size: SizeConfig.w(18),
                    ),
                  ),
                ],
              ),
            ),
            if (isExpanded)
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.h(8),
                  bottom: SizeConfig.h(8),
                  left: SizeConfig.w(6),
                  right: SizeConfig.w(6),
                ),
                child: widget.answer,
              ),
          ],
        ),
      ),
    );
  }
}
