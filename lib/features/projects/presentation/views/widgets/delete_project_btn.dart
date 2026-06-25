
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  });

  final int projectId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (dialogContext) {
            final cubit = context.read<CompanyProjectCubit>();
    
            return BlocConsumer<CompanyProjectCubit, CompanyProjectState>(
              bloc: cubit,
    
              listener: (context, state) {
                if (!state.isDeleting && state.error == null) {
                  Navigator.pop(dialogContext);
    
                  showCustomSnackBar(
                    context: context,
                    message: "تم حذف المشروع بنجاح 🗑️",
                    isSuccess: true,
                  );
                context.read<CompanyProjectCubit>().refreshClientProjects();
                }
    
                if (!state.isDeleting && state.error != null) {
                  Navigator.pop(dialogContext);
    
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
