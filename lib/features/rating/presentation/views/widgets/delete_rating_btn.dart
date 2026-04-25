import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_cubit.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_state.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';

class DeleteRatingBtn extends StatelessWidget {
  const DeleteRatingBtn({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (dialogContext) {
            final cubit = context.read<RatingsCubit>();

            return BlocConsumer<RatingsCubit, RatingsState>(
              bloc: cubit,
              listener: (context, state) {
                /// ✅ success
                if (state is RatingsDeleteSuccess) {
                  Navigator.pop(dialogContext);
                  showCustomSnackBar(
                    context: context,
                    message: "تم حذف التقييم بنجاح 🗑️",
                    isSuccess: true,
                  );
                }

                /// ❌ error
                if (state is RatingsDeleteError) {
                  Navigator.pop(dialogContext);

                  showCustomSnackBar(context: context, message: state.message);
                }
              },
              builder: (context, state) {
                final isLoading = state is RatingsDeleting;

                return DeleteOrderCard(
                  text: "هل أنت متأكد من حذف هذا التقييم؟",
                  isLoading: isLoading,
                  onPressed: isLoading
                      ? null
                      : () {
                          cubit.deleteRating(id);
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
          size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(22),
        ),
      ),
    );
  }
}
