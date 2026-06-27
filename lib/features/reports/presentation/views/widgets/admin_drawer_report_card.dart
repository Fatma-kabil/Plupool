import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:intl/intl.dart' as intl;
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';
import 'package:plupool/features/reports/presentation/views/widgets/admin_drawer_report_header_card.dart';
import 'package:plupool/features/reports/presentation/views/widgets/report_card_row.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_state.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class AdminDrawerReportCard extends StatefulWidget {
  const AdminDrawerReportCard({super.key, required this.model});
  final ContactMessageEntity model;

  @override
  State<AdminDrawerReportCard> createState() => _AdminDrawerReportCardState();
}

class _AdminDrawerReportCardState extends State<AdminDrawerReportCard> {
  @override
  Widget build(BuildContext context) {
    MessageStatus selected = mapMessageApiStatus(widget.model.status);

    String formatVisitDateTime(String? dateTime) {
      if (dateTime == null || dateTime.isEmpty) return "";

      final date = DateTime.parse(dateTime);

      return toArabicNumbers(
        intl.DateFormat(
          'dd / MM / yyyy - h:mm a',
          'ar',
        ).format(date).replaceAll('ص', 'صباحاً').replaceAll('م', 'مساءً'),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(15),
          vertical: SizeConfig.h(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---- Header ----
            AdminDrawerReportHeaderCard(
              userName: widget.model.name,
              userrole: widget.model.senderRole,
              status: mapMessageApiStatus(widget.model.status),
            ),
            SizedBox(height: SizeConfig.h(10)),

            ReportCardRow(
              title: "نوع الخدمة",
              value: widget.model.visit?['service_type'] ?? "",
            ),
            SizedBox(height: SizeConfig.h(5)),
            ReportCardRow(
              title: "رقم الزيارة",
              value: toArabicNumbers(
                widget.model.visit?['visit_number']?.toString() ?? "",
              ),
            ),
            SizedBox(height: SizeConfig.h(5)),
            ReportCardRow(
              title: "اسم الفني",
              value: widget.model.visit?['technicians_display'] ?? "",
            ),
            SizedBox(height: SizeConfig.h(5)),

            ReportCardRow(
              title: "تاريخ ووقت الزيارة",
              value: formatVisitDateTime(
                widget.model.visit?['visit_datetime'] ?? "",
              ),
            ),

            SizedBox(height: SizeConfig.h(8)),
            Divider(color: AppColors.textFieldBorderColor),
            SizedBox(height: SizeConfig.h(8)),

            /// ---- Status Selector + Delete ----
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " تعديل حالة البلاغ ",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
                SizedBox(height: 8),
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

                          context.read<ContactCubit>().updateMessageStatus(
                            widget.model.id,
                            mapMessageStatusToApi(val),
                          );
                        },
                      ),
                    ),

                    SizedBox(width: SizeConfig.w(35)),

                    GestureDetector(
                      onTap: () => {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return BlocConsumer<ContactCubit, ContactState>(
                              listener: (context, state) {
                                if (state is ContactDeleteSuccess) {
                                  Navigator.pop(context);
                                }
                              },
                              builder: (context, state) {
                                return DeleteOrderCard(
                                  text: "هل أنت متأكد من حذف هذا البلاغ ؟",
                                  isLoading: state is ContactDeleting,
                                  onPressed: state is ContactDeleting
                                      ? null
                                      : () {
                                          context
                                              .read<ContactCubit>()
                                              .deleteMessage(widget.model.id);
                                        },
                                );
                              },
                            );
                          },
                        ),
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
