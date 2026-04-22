import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class MessageStatusSection extends StatefulWidget {
  const MessageStatusSection({super.key, this.text, required this.selected, this.ondelete});
  final String? text;
  final MessageStatus selected;
  final void Function()? ondelete;

  @override
  State<MessageStatusSection> createState() => _MessageStatusSectionState();
}

class _MessageStatusSectionState extends State<MessageStatusSection> {
  late MessageStatus selected = widget.selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text ?? " تعديل حالة الرسالة ",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StatusSelector<MessageStatus>(
                selected: selected,
                items: const [
                  MessageStatus.pending_review,
                  MessageStatus.in_progress,
                  MessageStatus.resolved,
                ],
                displayText: (status) => statusText(status),
                onChanged: (val) {
                  setState(() => selected = val);
                },
              ),
            ),
            SizedBox(width: SizeConfig.w(35)),
            GestureDetector(
              onTap: widget.ondelete,
              child: Container(
                padding: EdgeInsets.all(SizeConfig.w(6)),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFAD7DA),
                ),
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Color(0xffE63946),
                  size: SizeConfig.w(20),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
