import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/support/domain/entities/contact_entity.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_state.dart';

import 'package:plupool/features/support/presentation/views/widgets/message_datails_view_header.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_details_section.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_section.dart';

class MessageDetailsBody extends StatelessWidget {
  const MessageDetailsBody({super.key, required this.message});
  final ContactEntity message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessageDatailsViewHeader(
            name: message.name,
            status: message.isActive!,
            imageUrl: message.imageUrl,
            location: message.address,
            phone: message.phone,
          ),
          SizedBox(height: 25),
          MessageDetailsSection(
            message: message.message,
            attachments: message.attachments,
          ),
          SizedBox(height: 25),
          MessageStatusSection(
            selected: mapMessageApiStatus(message.status),

            ondelete: () => {
              showDialog(
                context: context,
                builder: (dialogContext) {
                  final cubit = context.read<ContactCubit>();
                  return BlocConsumer<ContactCubit, ContactState>(
                    bloc: cubit,
                    listener: (context, state) {
                      if (state is ContactDeleteSuccess) {
                        Navigator.pop(context);
                        Navigator.pop(context, "deleted");
                        showCustomSnackBar(
                          context: context,
                          message: "تم حذف الرسالة 🗑️",
                          isSuccess: true,
                        );
                      }

                      if (state is ContactDeleteError) {
                        Navigator.pop(context);

                        showCustomSnackBar(
                          context: context,
                          message: state.message,
                        );
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is ContactDeleting;

                      return DeleteOrderCard(
                        text: "هل أنت متأكد من حذف هذه الرسالة؟",
                        isLoading: isLoading,
                        onPressed: isLoading
                            ? null
                            : () {
                                cubit.deleteMessage(message.id);
                              },
                      );
                    },
                  );
                },
              ),
            },
          ),
        ],
      ),
    );
  }
}
