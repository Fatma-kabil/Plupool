import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/support/data/models/message_model.dart';
import 'package:plupool/features/support/presentation/views/widgets/attachment_chip.dart';

class MessageDetailsSection extends StatelessWidget {
  const MessageDetailsSection({super.key, required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تفاصيل الرسالة ",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(12),
            vertical: SizeConfig.h(12),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
          ),
          child: Row(
            children: [
              Icon(
                Icons.note_alt_outlined,
                color: Color(0xffBBBBBB),
                size: SizeConfig.w(20),
              ),
              SizedBox(width: SizeConfig.w(4)),
              Expanded(
                child: Text(
                  message.message,
                  style: AppTextStyles.styleRegular16(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        message.files
            ? SizedBox(
                height: SizeConfig.h(30),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return AttachmentChip(fileName: "file.txt");
                  },
                ),
              )
            : Text(
                'لا توجد',
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Color(0xff777777)),
              ),
      ],
    );
  }
}
