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
    this.onVisionPressed,
    required this.projectId,
  });
  final void Function()? onEditPressed;
  final void Function()? onVisionPressed;
  final int projectId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      // mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onEditPressed,
          child: Icon(
            Icons.edit_note,
            color: AppColors.kprimarycolor,
            size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(24),
          ),
        ),
        SizedBox(width: SizeConfig.w(12)),
        Icon(
          Icons.visibility_outlined,
          color: Color(0xffFF9F1C),
          size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(24),
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
          child: Icon(
            Icons.delete_outline_rounded,
            color: Color(0xffE63946),
            size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(24),
          ),
        ),
      ],
    );
  }
}
