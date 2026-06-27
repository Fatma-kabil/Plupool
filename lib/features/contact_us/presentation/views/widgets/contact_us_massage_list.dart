import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_state.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_card.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_list_shimmer.dart';
class ContactUsMassageList extends StatelessWidget {
  const ContactUsMassageList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        if (state is ContactLoading) {
          return MessagesListShimmer();
        }

        if (state is ContactError) {
          return SliverToBoxAdapter(
            child: Center(
              child: ErrorText(message: state.message),
            ),
          );
        }

        if (state is ContactSuccess) {
          final messages = state.response.messages;

          if (messages.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: ErrorText(message: "📭 لا توجد رسائل حالياً"),
              ),
            );
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final message = messages[index];

                return MessageCard(
                  message: message,
                  onTap: () async {
                    final result = await context.push(
                      '/contactusdetailsview',
                      extra: message,
                    );

                    if (result == "deleted" && context.mounted) {
                      context.read<ContactCubit>().refresh();
                    }
                  },
                );
              },
              childCount: messages.length,
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}