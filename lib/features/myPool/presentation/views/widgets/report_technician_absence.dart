import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/home/domain/params/add_support_message_params.dart';
import 'package:plupool/features/home/presentaation/manager/Add_support_message_cubit/add_support_message_cubit.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/done_contact_us_card.dart';

class ReportTechnicianAbsence extends StatelessWidget {
  const ReportTechnicianAbsence({super.key, required this.bookingId});

  final int bookingId;

  @override
  Widget build(BuildContext context) {
    final double cardWidth = SizeConfig.screenWidth * 0.75;

    return BlocConsumer<AddSupportMessageCubit, AddSupportMessageState>(
      listener: (context, state) {
        if (state is AddSupportMessageSuccess) {
          Navigator.pop(context);

          showDialog(
            context: context,
            builder: (_) => const Dialog(child: DoneContactUsCard()),
          );
        }

        if (state is AddSupportMessageError) {
          Navigator.pop(context);
          showCustomSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(16),
            vertical: SizeConfig.h(35),
          ),
          child: Container(
            width: SizeConfig.isWideScreen ? cardWidth : double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(16),
              vertical: SizeConfig.h(43),
            ),
            decoration: BoxDecoration(
              color: AppColors.kScaffoldColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.report_problem,
                  size: SizeConfig.w(130),
                  color: const Color(0xffFFAF42),
                ),

                SizedBox(height: SizeConfig.h(15)),

                Text(
                  "هل متأكد من الإبلاغ عن غياب الفني؟",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.styleSemiBold20(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),

                SizedBox(height: SizeConfig.h(15)),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(16)),
                  child: Text(
                    "سيتم مراجعة البلاغ من فريق الدعم والتواصل معك في أقرب وقت.",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(color: const Color(0xff555555)),
                  ),
                ),

                SizedBox(height: SizeConfig.h(25)),

                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    CustomTextBtn(
                      text: "تأكيد الإبلاغ",
                      isLoading: state is AddSupportMessageLoading,
                      onPressed: state is AddSupportMessageLoading
                          ? null
                          : () {
                              context
                                  .read<AddSupportMessageCubit>()
                                  .addSupportMessage(
                                    AddSupportMessageParams(
                                      title: "بلاغ غياب عن الزيارة",
                                      //   message:
                                      //       "لن أكون موجودًا في موعد الزيارة",
                                      type: "absence",
                                      bookingId: bookingId,
                                      message: 'بلاغ غياب الفني عن الزياره',
                                    ),
                                  );
                            },
                      padding: SizeConfig.w(8),
                    ),

                    const Spacer(),

                    CustomOutlinedBtn(
                      padding: SizeConfig.isWideScreen ? 20 : 10,
                      width: SizeConfig.isWideScreen ? 190 : 120,
                      text: "إلغاء",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
