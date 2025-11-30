import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/support_expandable_card.dart';

class PrivcyViewBody extends StatelessWidget {
  const PrivcyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' الخصوصية والأمان في تطبيق Plupool',
            style: AppTextStyles.styleBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(16)),
          Text(
            " جميع المعلومات التي يتم جمعها تُستخدم فقط لتقديم خدمات أفضل وتجربة أكثر دقة داخل التطبيق.",
            style: AppTextStyles.styleRegular13(
              context,
            ).copyWith(color: Color(0xff777777)),
          ),
          SizedBox(height: SizeConfig.h(16)),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(15),
                vertical: SizeConfig.h(20),
              ),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SupportExpandableCard(
                    question: "البيانات التي نجمعها",
                    answer: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "الاسم ، رقم الموبايل ، بيانات حمام السباحة (إن وُجدت) ، سجل الخدمات والمشتريات",
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: Color(0xff999999),height: 1.9),
                        ),
                        SizedBox(height: SizeConfig.h(5)),
                        Text(
                          "ملاحظة:",
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: AppColors.ktextcolor),
                        ),
                        SizedBox(height: SizeConfig.h(5)),
                        Text(
                          " تسجيل الدخول بيتم باستخدام رقم الموبايل وكود التحقق (OTP) فقط، بدون كلمة مرور علشان نضمن أسرع وأأمن طريقة دخول.",
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: Color(0xff999999),height: 1.9),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(15)),
                  SupportExpandableCard(
                    question: "  كيف نحمي معلوماتك؟",
                    answer: Text(
                      "• بنستخدم طرق تشفير حديثة لحماية بياناتك أثناء الإرسال والاستقبال.\n"
                      "• بنمنع أي حد غير مخوّل من الوصول لبيانات حسابك.\n"
                      "• بنراقب النظام باستمرار لضمان عدم حدوث أي نشاط مش طبيعي.",
                      style: AppTextStyles.styleMedium16(
                        context,
                      ).copyWith(color: Color(0xff999999),height: 1.9),
                    ),
                  ),
                    SizedBox(height: SizeConfig.h(15)),
                  SupportExpandableCard(
                    question: "عدم مشاركة البيانات",
                    answer: Text(
                     "لا نقوم بمشاركة أو بيع أي بيانات شخصية إلى أي جهة خارجية.\n البيانات تُستخدم فقط داخل نظام Plupool بشكل آمن ومشفر.",
                       style: AppTextStyles.styleMedium16(
                        context,
                      ).copyWith(color: Color(0xff999999),height: 1.9),
                    ),
                  ),
                   SizedBox(height: SizeConfig.h(15)),
                  SupportExpandableCard(
                    question: "استخدام البيانات",
                    answer: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "بياناتك بنستخدمها فقط عشان:",
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: Color(0xff555555)),
                        ),
                        SizedBox(height: SizeConfig.h(5)),
                        Text(
                          "•  نأكد هويتك عند تسجيل الدخول.\n"
                          "•  نعرف نوصلك بالخدمة المناسبة.\n"
                          "•  نتابع حالة طلباتك ونبعتلك إشعارات مهمة.\n"
                           "•  نقدر نطوّر التجربة وجودة الخدمات داخل التطبيق.\n",
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: Color(0xff999999),height: 1.9),
                        ),
                      ],
                    ),
                  ),
                    SizedBox(height: SizeConfig.h(15)),
                  SupportExpandableCard(
                    question: " التحكم الكامل في حسابك",
                    answer: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "تقدر في أي وقت:",
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: Color(0xff555555)),
                        ),
                        SizedBox(height: SizeConfig.h(5)),
                        Text(
                          "•  تعدّل بياناتك.\n"
                          "•  تطلب حذف حسابك بالكامل.\n",
                         
                          style: AppTextStyles.styleMedium16(
                            context,
                          ).copyWith(color: Color(0xff999999),height: 1.9),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: SizeConfig.h(15)),
                  SupportExpandableCard(
                    question: " التحديثات",
                    answer: Text(
                     "قد نقوم بتحديث سياسة الخصوصية من وقت لآخر لتحسين الخدمة.\n سنقوم بإخطارك داخل التطبيق في حال وجود أي تغييرات مهمة.",
                     
                      style: AppTextStyles.styleMedium16(
                        context,
                      ).copyWith(color: Color(0xff999999),height: 1.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
