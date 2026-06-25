import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';

class OurProjectCardFooter extends StatelessWidget {
  const OurProjectCardFooter({
    super.key,
    this.onEditPressed,
    this.isActive,
    required this.projectId,
  });

  final void Function()? onEditPressed;
  final bool isActive;
  final int projectId;

  Widget _iconWrap({required Widget child, required Color bg}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bg.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onEditPressed,
          child: _iconWrap(
            bg: AppColors.kprimarycolor,
            child: Icon(
              Icons.edit_note,
              color: AppColors.kprimarycolor,
              size: SizeConfig.isWideScreen
                  ? SizeConfig.w(18)
                  : SizeConfig.w(24),
            ),
          ),
        ),

        SizedBox(width: SizeConfig.w(12)),

      GestureDetector(
  onTap: () {
    context.read<OurProjectsCubit>().toggleProjectActive(projectId);
  },
  child: _iconWrap(
    bg: 
         const Color(0xffE63946)
        
    child: Icon(
      isActive
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
      color: 
           const Color(0xffE63946)
          
      size: SizeConfig.isWideScreen
          ? SizeConfig.w(18)
          : SizeConfig.w(24),
    ),
  ),
),

        SizedBox(width: SizeConfig.w(12)),

        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (dialogContext) {
                final cubit = context.read<OurProjectsCubit>();

                return BlocConsumer<OurProjectsCubit, OurProjectsState>(
                  bloc: cubit,
                  listener: (context, state) {
                    if (!state.isDeleting && state.error == null) {
                      Navigator.pop(dialogContext);

                      showCustomSnackBar(
                        context: context,
                        message: "تم حذف المشروع بنجاح 🗑️",
                        isSuccess: true,
                      );
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
          child: _iconWrap(
            bg: const Color(0xffE63946),
            child: Icon(
              Icons.delete_outline_rounded,
              color: const Color(0xffE63946),
              size: SizeConfig.isWideScreen
                  ? SizeConfig.w(18)
                  : SizeConfig.w(24),
            ),
          ),
        ),
      ],
    );
  }
}