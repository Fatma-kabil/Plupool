import 'package:flutter/widgets.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_card.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key, required this.selected});

  final String selected;

  @override
  Widget build(BuildContext context) {
    final filteredMessages = messages.where((message) {
      if (selected == "قيد المراجعه") {
        return message.status == RequestStatus.scheduled;
      } else {
        return message.status == RequestStatus.completed;
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
            message: filteredMessages[index],
          );
        },
        childCount: filteredMessages.length,
      ),
    );
  }
}
