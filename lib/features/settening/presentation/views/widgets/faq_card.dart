import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_cubit.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_state.dart';
import 'package:plupool/features/settening/presentation/views/widgets/edit_ques_card.dart';

class FaqCard extends StatelessWidget {
  final FaqEntity item;
  final bool isExpanded;
  final VoidCallback onToggle;
  final bool isHidden;
  final VoidCallback onToggleHide;

  const FaqCard({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.onToggle,
    required this.isHidden,
    required this.onToggleHide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(8),
      ),
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.question,
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
                IconButton(
                  icon: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.ktextcolor,
                    size: SizeConfig.w(20),
                  ),
                  onPressed: onToggle,
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox(),
            secondChild: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(12),
                vertical: SizeConfig.h(8),
              ),
              child: Text(
                item.answer,
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.h(8),
              bottom: SizeConfig.h(12),
              //   vertical: SizeConfig.h(8),
            ),
            child: Divider(height: SizeConfig.h(1)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomOutlinedBtn(
                text: "تعديل",
                width: SizeConfig.w(110),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditQuesCard(item: item),
                  );
                },
                trailing: Icon(
                  Icons.edit_note,
                  size: SizeConfig.w(20),
                  color: AppColors.kprimarycolor,
                ),
              ),
              CustomOutlinedBtn(
                color: Color(0xffFF9F1C),
                text: isHidden ? "إظهار" : "إخفاء",
                width: SizeConfig.w(110),
                onPressed: onToggleHide,
                trailing: Icon(
                  isHidden ? Icons.visibility : Icons.visibility_off,
                  size: SizeConfig.w(20),
                  color: Color(0xffFF9F1C),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                       final cubit = context.read<FaqCubit>();
                      return BlocConsumer<FaqCubit, FaqState>(
                           bloc: cubit, 
                        listener: (context, state) {
                          if (state is FaqDeleted) {
                            Navigator.pop(context);

                            showCustomSnackBar(
                              context: context,
                              message: "تم حذف السؤال 🗑️",
                              isSuccess: true,
                            );
                          }

                          if (state is FaqError) {
                            Navigator.pop(context);

                            showCustomSnackBar(
                              context: context,
                              message: state.message,
                            );
                          }
                        },
                        builder: (context, state) {
                        
                          final isLoading = state is FaqLoading;

                          return DeleteOrderCard(
                            text: "هل أنت متأكد من حذف هذا السؤال؟",
                            isLoading: isLoading,
                            onPressed: isLoading
                                ? null
                                : () {
                                    cubit.deleteFaq(item.id!);
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
                    size: SizeConfig.isWideScreen
                        ? SizeConfig.w(18)
                        : SizeConfig.w(22),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
