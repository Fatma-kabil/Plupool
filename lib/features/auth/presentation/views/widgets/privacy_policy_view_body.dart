import 'package:flutter/cupertino.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/privacy_contact_section.dart';
import 'package:plupool/features/auth/presentation/views/widgets/privacy_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/usage_section_card.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.w(22),
        right: SizeConfig.w(22),
        top: SizeConfig.h(35),
        bottom: SizeConfig.h(22),
      ),
      child: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrivacyHeader(),
             const SizedBox(height: 20),
              UsageSectionCard(
              title: "شروط الاستخدام 📘",
              items: [
                "يُحظر استخدام التطبيق لأي غرض غير قانوني أو يسبب ضرر للآخرين.",
                "أنت مسؤول عن صحة البيانات التي تدخلها وعن سرية حسابك.",
                "تحتفظ إدارة التطبيق بالحق في تعليق أو حذف الحساب في حال إساءة الاستخدام.",
                "الأسعار والخدمات قد تختلف حسب نوع الخدمه.",
                "لا تتحمل الشركة أي مسؤولية عن أي تعامل مالي يتم خارج الإشراف المباشر لفريق العمليات، كما لا يجوز للعميل أو الفني الاتفاق على أي تعامل مالي أو خدمة إضافية خارج نطاق التطبيق أو دون إشعار الشركة.",
                "أي خرق لهذه السياسة يعفي الشركة من أي التزام تجاه الطرفين.",
                "جميع الطلبات والخدمات المقدمة عبر التطبيق تخضع للتوفر والجدولة بناءً على موقعك وتوفر الفنيين."
              ],
            ),
             const SizedBox(height: 20),
             UsageSectionCard(
              title: "سياسة الخصوصية 🔒",
              items: [
                "نحن نجمع معلوماتك الشخصية مثل الاسم والعنوان لتقديم الخدمات المطلوبة وتحسين تجربتك.",
                "لن نبيع أو نؤجر معلوماتك الشخصية لأي طرف ثالث لأغراض التسويق.",
                "تُستخدم بياناتك لتحديد الخدمات الأقرب لك وتقديم عروض مصممة خصيصًا لك.",
              ],
            ),
             const SizedBox(height: 20),
               const PrivacyContactSection(),
            ]
        ),
      ),
    );
  }
}
