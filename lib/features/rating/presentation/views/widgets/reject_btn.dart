
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_cubit.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_state.dart';
import 'package:plupool/features/rating/presentation/views/widgets/accept_reject_card.dart';

class RejectBtn extends StatelessWidget {
  const RejectBtn({super.key, required this.id});
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
                if (state is RatingsActionSuccess) {
                  Navigator.pop(dialogContext);
                  showCustomSnackBar(
                    context: context,
                    message: "تم رفض نشر هذا التقييم ❌",
                    isSuccess: true,
                  );
                }

                /// ❌ error
                if (state is RatingsActionError) {
                  Navigator.pop(dialogContext);

                  showCustomSnackBar(context: context, message: state.message);
                }
              },
              builder: (context, state) {
                final isLoading = state is RatingsActionLoading;

                return AcceptRejectCard(
                  text: "رفض التقييم",
                  subTitle: "هل أنت متأكد من رفض هذا التقييم؟ لن يظهر للعملاء.",
                  isLoading: isLoading,
                  onPressed: isLoading
                      ? null
                      : () {
                          cubit.rejectRating(id);
                        },
                );
              },
            );
          },
        );
      },child: 
    
    
    
    Container(
      padding: EdgeInsets.all(SizeConfig.w(6)),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffFAD7DA),
      ),
      child: Icon(
        Icons.close,
        color: Color(0xffE63946),
        size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(22),
      ),
     ), );
  }
}
