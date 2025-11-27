import 'package:flutter/material.dart';

class HelpViewBody extends StatelessWidget {
  const HelpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}


class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  final List<FaqItem> items = [
    FaqItem(
      question: "إزاي أشوف المهام المطلوبة خلال الأسبوع؟",
      answer:
          "تقدر تشوف جدول مهامك الأسبوعية من صفحة الرئيسية عند الضغط على عرض المزيد، هتظهر صفحة المهام الأسبوعية اللي فيها ترتيب المهام حسب الأيام.",
    ),
    FaqItem(
      question: "إزاي أتواصل مع الدعم؟",
      answer: "تواصل مع الدعم من صفحة مركز المساعدة الموجودة في (حسابي).",
    ),
    FaqItem(
      question: "إزاي أدخل على ملف كل عميل؟",
      answer:
          "عند الضغط على الكارد الموجود فيه تفاصيل المهمة الخاصة بكل عميل.",
    ),
    FaqItem(
      question: "فين ألاقي تاريخ مشترياتي؟",
      answer:
          "من (المنتج) تقدر تلاقي علامة السلة ثم الضغط عليها.",
    ),
    FaqItem(
      question: "كيف أغير رقم الهاتف؟",
      answer:
          "تقدر تغير رقم الهاتف من (حسابي) ثم الضغط على معلومات الحساب ثم تعديل البيانات.",
    ),
  ];

  List<bool> expanded = [];

  @override
  void initState() {
    expanded = List.generate(items.length, (_) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = items[index];

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      expanded[index] = !expanded[index];
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.question,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // السهم
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 250),
                        turns: expanded[index] ? 0.5 : 0, // يفتح ويقفل
                        child: const Icon(Icons.keyboard_arrow_down),
                      )
                    ],
                  ),
                ),

                // الإجابة
                if (expanded[index])
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      item.answer,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: items.length,
      ),
    );
  }
}
