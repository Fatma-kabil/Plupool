import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/support/domain/entities/contact_entity.dart';
import 'package:plupool/features/support/presentation/views/widgets/attachment_chip.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_card_title.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.message, this.onTap});

  final ContactEntity message;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final status = mapMessageApiStatus(message.status);
    final colors = MessageStatusColors.getColors(status);
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(10)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessageCardTitle(
            role: message.senderRole,
            name: message.name,
            onTap: onTap,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text(
                'تاريخ الإرسال',
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
              Spacer(),
              Text(
                formatArabicDate(message.createdAt.toString()),
                style: AppTextStyles.styleSemiBold15(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'الحالة',
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.h(5),
                  horizontal: SizeConfig.w(15),
                ),
                decoration: BoxDecoration(
                  color: colors['labelBg'],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  statusText(status),
                  style: AppTextStyles.styleSemiBold14(
                    context,
                  ).copyWith(color: colors['labelText']),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(15),
              vertical: SizeConfig.h(12),
            ),
            child: Divider(),
          ),
          Text(
            'المرفقات:',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: Color(0xff555555)),
          ),
          SizedBox(height: 10),
          message.attachments.isNotEmpty
              ? SizedBox(
                  height: SizeConfig.h(30),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: message.attachments.length,
                    itemBuilder: (context, index) {
                      final file = message.attachments[index];

                      return AttachmentChip(
                        fileName: file.toString().split('/').last,
                      );
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
      ),
    );
  }
}
