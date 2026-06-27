import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/packages_tab_bar.dart';
import 'package:plupool/features/reports/presentation/views/widgets/admin_drawer_report_card.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_state.dart';

class AdminDrawerReportViewBody extends StatefulWidget {
  const AdminDrawerReportViewBody({super.key});

  @override
  State<AdminDrawerReportViewBody> createState() =>
      _AdminDrawerReportViewBodyState();
}

class _AdminDrawerReportViewBodyState
    extends State<AdminDrawerReportViewBody> {
  String selectedTab = "جديد";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContactCubit>().getMessages(type: "complaint");
    });
  }

  String? get status {
    switch (selectedTab) {
      case "قيد المراجعة":
        return "in_progress";
      case "تم الحل":
        return "resolved";
      default:
        return "pending_review";
    }
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
        final cubit = context.read<ContactCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PackagesTabBar(
              borderRaduis: SizeConfig.w(10),
              selectedTab: selectedTab,
              onTabSelected: (tab) {
                setState(() => selectedTab = tab);

                cubit.getMessages(
                  type: "complaint",
                  status: status,
                );
              },
              counts: {
                "جديد": cubit.pendingReview,
                "قيد المراجعة": cubit.inProgress,
                "تم الحل": cubit.resolved,
              },
            ),

            SizedBox(height: SizeConfig.h(16)),

            const Text("ابحث عن العميل:"),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(4),
                vertical: SizeConfig.h(20),
              ),
              child: CustomSearchPerson(
                hintText: "ابحث باسم العميل أو رقم الهاتف",
                onChanged: (value) {
                  cubit.getMessages(
                    type: "complaint",
                    status: status,
                    search: value,
                  );
                },
              ),
            ),

            Expanded(
              child: Builder(
                builder: (_) {
                  if (state is ContactLoading) {
                    // return const ReportListShimmer();
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ContactError) {
                    return Center(
                      child: ErrorText(message: state.message),
                    );
                  }

                  if (state is ContactSuccess) {
                    final reports = state.response.messages;

                    if (reports.isEmpty) {
                      return const Center(
                        child: Text("لا توجد بلاغات"),
                      );
                    }

                    return ListView.builder(
                      itemCount: reports.length,
                      itemBuilder: (context, index) {
                        return AdminDrawerReportCard(
                          model: reports[index],
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}