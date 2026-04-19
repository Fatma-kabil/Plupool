import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_cubit.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_state.dart';
import 'package:plupool/features/settening/presentation/views/widgets/add_edit_ques_form.dart';

class AddQuesCard extends StatefulWidget {
  const AddQuesCard({super.key, required this.role});
  final String role;

  @override
  State<AddQuesCard> createState() => _AddQuesCardState();
}

class _AddQuesCardState extends State<AddQuesCard> {
  final formKey = GlobalKey<FormState>();

  final questionController = TextEditingController();
  final answerController = TextEditingController();
  final orderController = TextEditingController();

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    orderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<FaqCubit, FaqState>(
        listener: (context, state) {
          if (state is FaqSuccess || state is FaqCreated) {
              showCustomSnackBar(context: context, message: "تم إضافة السؤال بنجاح 🎉",isSuccess: true);
            Navigator.pop(context);

           
          }

          if (state is FaqError) {
            showCustomSnackBar(context: context, message: state.message, isSuccess: false);
          }
        },
        builder: (context, state) {
          final isLoading = state is FaqLoading;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            insetPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(20),
              vertical: SizeConfig.h(29),
            ),
            child: Container(
              width: SizeConfig.isWideScreen
                  ? SizeConfig.screenWidth * 0.85
                  : double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(20),
                vertical: SizeConfig.h(25),
              ),
              decoration: BoxDecoration(
                color: AppColors.kScaffoldColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AddEditQuesForm(
                      formKey: formKey,
                      questionController: questionController,
                      answerController: answerController,
                      orderController: orderController,
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextBtn(
                          text: isLoading ? "جاري .." : "إضافة",
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<FaqCubit>().createFaq(
                                          FaqEntity(
                                            id: 0,
                                            question:
                                                questionController.text,
                                            answer: answerController.text,
                                            sortOrder: int.tryParse(
                                                    orderController.text) ??
                                                0,
                                            isActive: true,
                                            targetRole: widget.role,
                                          ),
                                        );
                                  }
                                },
                          padding:
                              SizeConfig.isWideScreen ? 12 : 7,
                          width: SizeConfig.w(120),
                          textStyle: AppTextStyles.styleBold16(context)
                              .copyWith(color: Colors.white),
                          trailing: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                          ),
                        ),

                        CustomOutlinedBtn(
                          text: 'إلغاء',
                          onPressed: isLoading
                              ? null
                              : () => Navigator.pop(context),
                          trailing: Icon(
                            Icons.cancel_outlined,
                            color: AppColors.kprimarycolor,
                            size: SizeConfig.w(15),
                          ),
                          width: SizeConfig.w(120),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}