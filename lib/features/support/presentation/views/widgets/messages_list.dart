import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_card.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key, required this.selected});

  final String selected;

  @override
  Widget build(BuildContext context) {
    final filteredMessages = messages.where((message) {
      if (selected == "قيد المراجعه") {
        return message.status == MessageStatus.pending;
      } else {
        return message.status == MessageStatus.solved;
      }
    }).toList();

    if (filteredMessages.isEmpty) {
      return  SliverToBoxAdapter(
        child: Center(
          child: Text('لا توجد رسائل',style: AppTextStyles.styleSemiBold25(context),),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return MessageCard(
            onTap: () => context.push('/messagedetails', extra: filteredMessages[index]),
            message: filteredMessages[index],
          );
        },
        childCount: filteredMessages.length,
      ),
    );
  }
}
