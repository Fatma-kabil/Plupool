import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/reports/presentation/views/widgets/admin_drawer_report_shimmer_list.dart';
import 'package:plupool/features/reports/presentation/views/widgets/company_res_reports_section.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_state.dart';
import 'package:plupool/features/support/presentation/views/widgets/company_res_support_section.dart';

class TehPoolOwnerContactUsViewBody extends StatefulWidget {
  const TehPoolOwnerContactUsViewBody({super.key, required this.user});
  final UserDetailsEntity user;
  @override
  State<TehPoolOwnerContactUsViewBody> createState() =>
      _TehPoolOwnerContactUsViewBodyState();
}

class _TehPoolOwnerContactUsViewBodyState
    extends State<TehPoolOwnerContactUsViewBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContactCubit>().getMessages(
        userId: widget.user.user.id,
        senderRole: widget.user.user.role,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state is ContactDeleteSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم حذف البلاغ بنجاح",
            isSuccess: true,
          );
        }

        if (state is ContactDeleteError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: false,
          );
        }

        if (state is ContactUpdateSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم تحديث الحالة",
            isSuccess: true,
          );
        }

        if (state is ContactUpdateError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: false,
          );
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: SizeConfig.h(SizeConfig.isWideScreen ? 55 : 44),
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF1F1F1),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 1),
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: TabBar(
                    labelStyle: AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(fontFamily: 'Cairo'),
                    unselectedLabelStyle: AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(fontFamily: 'Cairo'),
                    indicatorPadding: EdgeInsets.symmetric(
                      vertical: SizeConfig.h(7),
                      horizontal: SizeConfig.w(7),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 0,
                    labelColor: AppColors.kprimarycolor,
                    unselectedLabelColor: const Color(0xff7B7B7B),
                    indicator: BoxDecoration(
                      color: const Color(0xffCCE4F0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: const [
                      Tab(text: 'البلاغات'),
                      Tab(text: 'رسائل الدعم'),
                    ],
                  ),
                ),
              ),

              SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(6),
                    vertical: SizeConfig.h(22),
                  ),
                  child: Builder(
                    builder: (_) {
                      if (state is ContactLoading ||
                          state is ContactUpdateLoading) {
                        return const TabBarView(
                          children: [
                            AdminDrawerReportShimmerList(),
                            AdminDrawerReportShimmerList(),
                          ],
                        );
                      }

                      if (state is ContactError) {
                        return Center(child: ErrorText(message: state.message));
                      }

                      if (state is ContactSuccess) {
                        final messages = state.response.messages;

                        final reports = messages
                            .where((e) => e.type == "complaint")
                            .toList();

                        final supports = messages
                            .where((e) => e.type == "support")
                            .toList();

                        return TabBarView(
                          children: [
                            CompanyResReportsSection(reports: reports),
                            CompanyResSupportSection(messages: supports),
                          ],
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
