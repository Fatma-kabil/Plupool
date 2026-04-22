import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_state.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_card.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_list_shimmer.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key, required this.selected});

  final String selected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        /// 🔄 loading
        if (state is ContactLoading) {
          return MessagesListShimmer();
        }

        /// ❌ error
        if (state is ContactError) {
          return SliverToBoxAdapter(
            child: Center(child: ErrorText(message: state.message)),
          );
        }

        /// ✅ success
        if (state is ContactSuccess) {
          final messages = state.messages;

          /// 🔥 فلترة UI (مش API)
          final filteredMessages = messages.where((message) {
            if (selected == "جديد") {
              return message.status == "pending_review";
            } else if (selected == "تم الحل") {
              return message.status == "resolved";
            } else {
              return message.status == "in_progress";
            }
          }).toList();

          if (filteredMessages.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: ErrorText(message: '📭 لا توجد رسائل حالياً'),
              ),
            );
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final message = filteredMessages[index];

              return MessageCard(
                onTap: () async {
                  final result = await context.push(
                    '/messagedetails',
                    extra: message,
                  );

                  if (result == "deleted" && context.mounted) {
                    context.read<ContactCubit>().refresh();
                  }
                },
                message: message,
              );
            }, childCount: filteredMessages.length),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
