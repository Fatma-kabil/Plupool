import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/company_project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';

class DeleteProjectBtn extends StatelessWidget {
  const DeleteProjectBtn({
    super.key,
    required this.projectId,
    this.onDeleted,
  });

  final int projectId;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (dialogContext) {
            final cubit = context.read<CompanyProjectCubit>();

            bool deleteStarted = false;

            return BlocConsumer<CompanyProjectCubit, CompanyProjectState>(
              bloc: cubit,

              listener: (context, state) {
                // ================= SUCCESS =================
                if (deleteStarted &&
                    !state.isDeleting &&
                    state.error == null) {
                  deleteStarted = false;

                  if (dialogContext.mounted) {
                    Navigator.of(dialogContext).pop();
                  }

                  showCustomSnackBar(
                    context: context,
                    message: "تم حذف المشروع بنجاح 🗑️",
                    isSuccess: true,
                  );

                  // تحديث القائمة بعد الحذف
                  onDeleted?.call();
                }

                // ================= ERROR =================
                if (deleteStarted &&
                    !state.isDeleting &&
                    state.error != null) {
                  deleteStarted = false;

                  if (dialogContext.mounted) {
                    Navigator.of(dialogContext).pop();
                  }

                  showCustomSnackBar(
                    context: context,
                    message: state.error!,
                  );
                }
              },

              builder: (context, state) {
                return DeleteOrderCard(
                  text: "هل أنت متأكد من حذف هذا المشروع؟",
                  isLoading: state.isDeleting,
                  onPressed: state.isDeleting
                      ? null
                      : () {
                          deleteStarted = true;

                          cubit.deleteProject(projectId);
                        },
                );
              },
            );
          },
        );
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
    );
  }
}