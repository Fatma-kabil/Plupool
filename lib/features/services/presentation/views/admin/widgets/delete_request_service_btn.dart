import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/services/presentation/manager/requested_cubit/requedted_cubit.dart';
import 'package:plupool/features/services/presentation/manager/requested_cubit/requested_state.dart';

class DeleteRequestServiceBtn extends StatelessWidget {
  const DeleteRequestServiceBtn({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (dialogContext) {
            final cubit = context.read<RequestsCubit>();

            return BlocConsumer<RequestsCubit, RequestsState>(
              bloc: cubit,
              listener: (context, state) {
                /// ✅ success
                if (state is RequestDeleteSuccess) {
                  Navigator.pop(dialogContext);
                  showCustomSnackBar(
                    context: context,
                    message: "تم حذف الطلب بنجاح 🗑️",
                    isSuccess: true,
                  );
                }

                /// ❌ error
                if (state is RequestDeleteError) {
                  Navigator.pop(dialogContext);

                  showCustomSnackBar(context: context, message: state.message);
                }
              },
              builder: (context, state) {
                final isLoading = state is RequestsActionLoading;

                return DeleteOrderCard(
                  text: "هل أنت متأكد من حذف هذا الطلب؟",
                  isLoading: isLoading,
                  onPressed: isLoading
                      ? null
                      : () {
                          cubit.deleteRequest(id);
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
