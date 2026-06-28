import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/companyres_contactus_details_header.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_state.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_details_section.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_section.dart';

class ContactUsDetailsViewBody extends StatefulWidget {
  const ContactUsDetailsViewBody({super.key, required this.message});

  final ContactMessageEntity message;

  @override
  State<ContactUsDetailsViewBody> createState() =>
      _ContactUsDetailsViewBodyState();
}

class _ContactUsDetailsViewBodyState extends State<ContactUsDetailsViewBody> {
  late MessageStatus selected;

  @override
  void initState() {
    super.initState();
    selected = mapMessageApiStatus(widget.message.status);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CompanyresContactusDetailsHeader(message: widget.message),
          SizedBox(height: 25),
          MessageDetailsSection(
            message: widget.message.message,
            attachments: widget.message.attachments,
          ),
          SizedBox(height: 25),
          BlocConsumer<ContactCubit, ContactState>(
            listener: (context, state) {
              if (state is ContactDeleteSuccess) {
                showCustomSnackBar(
                  context: context,
                  message: "تم حذف الرسالة 🗑️",
                  isSuccess: true,
                );

                Navigator.pop(context, "deleted");
              }

              if (state is ContactUpdateSuccess) {
                showCustomSnackBar(
                  context: context,
                  message: "تم تحديث الحالة ✔️",
                  isSuccess: true,
                );
              }

              if (state is ContactDeleteError) {
                showCustomSnackBar(context: context, message: state.message);
              }

              if (state is ContactUpdateError) {
                showCustomSnackBar(context: context, message: state.message);
              }
            },

            builder: (context, state) {
              final isDeleteLoading = state is ContactDeleting;
              //   final isUpdateLoading = state is ContactUpdateLoading;

              return MessageStatusSection(
                selected: selected,

                onChanged: (val) {
                  setState(() => selected = val);

                  context.read<ContactCubit>().updateMessageStatus(
                    widget.message.id,
                    mapMessageStatusToApi(val),
                  );
                },

                ondelete: (isDeleteLoading)
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            final cubit = context.read<ContactCubit>();

                            return DeleteOrderCard(
                              text: "هل أنت متأكد من حذف هذه الرسالة؟",
                              isLoading: state is ContactDeleting,
                              onPressed: state is ContactDeleting
                                  ? null
                                  : () {
                                      cubit.deleteMessage(widget.message.id);
                                    },
                            );
                          },
                        );
                      },
              );
            },
          ),
        ],
      ),
    );
  }
}
