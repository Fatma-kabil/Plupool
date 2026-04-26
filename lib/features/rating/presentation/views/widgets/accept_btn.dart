
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_cubit.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_state.dart';
import 'package:plupool/features/rating/presentation/views/widgets/accept_reject_card.dart';

class AcceptBtn extends StatelessWidget {
  const AcceptBtn({
    super.key, required this.id,
  });
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
                    message: "تم نشر التقييم بنجاح ✅",
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
                  text: "تأكيد النشر",
                  subTitle: "هل أنت متأكد من الموافقة على هذا التقييم ونشره للعموم؟",
                  isLoading: isLoading,
                  onPressed: isLoading
                      ? null
                      : () {
                          cubit.approveRating(id);
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
        color: Color(0xffCCF0F7),
      ),
      child: Icon(
        Icons.check,
        color: Color(0xff0077B6),
        size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(22),
      ),
    ),
    );
  }
}
