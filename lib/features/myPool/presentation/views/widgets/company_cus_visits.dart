import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';

import 'package:plupool/features/myPool/presentation/views/manager/company_pool_cubit/comapny_pool_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_pool_cubit/company_pool_state.dart';

import 'package:plupool/features/myPool/presentation/views/widgets/add_note.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_visits_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_task_card_shimmer.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/visit_card.dart';

import 'package:plupool/features/support/presentation/views/widgets/attachment_chip.dart';

class CompanyCusVisits extends StatefulWidget {
  const CompanyCusVisits({super.key});

  @override
  State<CompanyCusVisits> createState() => _CompanyCusVisitsState();
}

class _CompanyCusVisitsState extends State<CompanyCusVisits> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyPoolCubit, CompanyPoolState>(
      builder: (context, state) {
        if (state is CompanyPoolLoading) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (_, __) => const MyPoolTaskCardShimmer(),
          );
        }

        if (state is CompanyPoolFailure) {
          return Center(
            child: ErrorText(message: "حدث خطأ أثناء تحميل البيانات"),
          );
        }

        if (state is! CompanyPoolSuccess) {
          return const SizedBox();
        }

        final packages = state.data.items
            .where((e) => e.tab == "packages")
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: packages.length,

              itemBuilder: (context, index) {
                final request = packages[index];

                final List<Widget> visitCards = [];

                if (request.nextVisit != null) {
                  visitCards.add(
                    VisitCard(
                      progress: 1,

                      visits: request.visitsCount ?? 1,

                      status: RequestStatus.scheduled,

                      date: request.nextVisit!.date,

                      bookingId: request.bookingId,

                      technicianNames: request.technicians
                          .map((e) => e.name)
                          .toList(),

                      technicianImages: request.technicians
                          .map((e) => e.profileImage)
                          .toList(),
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    CompanyVisitsCard(service: request),

                    SizedBox(height: SizeConfig.h(12)),

                    Text(
                      "الزيارات",

                      style: AppTextStyles.styleBold16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),

                    SizedBox(height: SizeConfig.h(12)),

                    ...visitCards,

                    SizedBox(height: SizeConfig.h(20)),
                  ],
                );
              },
            ),

            const AddNote(),

            SizedBox(height: SizeConfig.h(20)),

            Text(
              "الملاحظات",

              style: AppTextStyles.styleBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),

            SizedBox(height: SizeConfig.h(12)),

            ListView.separated(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              itemCount: state.data.notes.length,

              separatorBuilder: (_, __) => SizedBox(height: SizeConfig.h(12)),

              itemBuilder: (context, index) {
                final note = state.data.notes[index];

                return Container(
                  width: double.infinity,

                  padding: EdgeInsets.all(SizeConfig.w(12)),

                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff777777)),

                    borderRadius: BorderRadius.circular(SizeConfig.w(10)),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        textDirection: TextDirection.rtl,

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            formatMonthDate(note.createdAt),

                            style: AppTextStyles.styleRegular14(
                              context,
                            ).copyWith(color: const Color(0xff777777)),
                          ),

                          Text(
                            formatTimeArabic2(note.createdAt),

                            style: AppTextStyles.styleRegular14(
                              context,
                            ).copyWith(color: const Color(0xff777777)),
                          ),
                        ],
                      ),

                      if (note.note.trim().isNotEmpty) ...[
                        SizedBox(height: SizeConfig.h(10)),

                        Row(
                          textDirection: TextDirection.rtl,

                          children: [
                            Icon(
                              Icons.notes,

                              size: SizeConfig.w(20),

                              color: const Color(0xff999999),
                            ),

                            SizedBox(width: SizeConfig.w(6)),

                            Expanded(
                              child: Text(
                                note.note,

                                textDirection: TextDirection.rtl,

                                style: AppTextStyles.styleRegular14(
                                  context,
                                ).copyWith(color: const Color(0xff777777)),
                              ),
                            ),
                          ],
                        ),
                      ],

                      if (note.files.isNotEmpty) ...[
                        SizedBox(height: SizeConfig.h(10)),

                        Wrap(
                          spacing: SizeConfig.w(8),

                          runSpacing: SizeConfig.h(8),

                          children: note.files.map((file) {
                            return AttachmentChip(
                              fileName: file.originalName,

                              fileUrl: file.fileUrl,
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: SizeConfig.h(20)),
          ],
        );
      },
    );
  }
}
