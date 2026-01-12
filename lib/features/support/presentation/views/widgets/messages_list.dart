import 'package:flutter/widgets.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_card.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return MessageCard(message: messages[index]);
      }, childCount: messages.length),
    );
  }
}
