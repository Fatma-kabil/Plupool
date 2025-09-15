import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'role_card.dart';

class SelectRoleViewBody extends StatelessWidget {
  const SelectRoleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Text(
            "اختر دورك",
        //    style: AppTextStyles.styleBold24(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "حدد نوع حسابك للحصول على تجربة مخصصة",
        
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          RoleCard(
            title: "صاحب حمام سباحة",
            subtitle: "احجز خدمات الإنشاء أو الصيانة و تابع حمامك بخدمات ذكية",
            icon: Icons.pool,
            onTap: () {},
          ),
          RoleCard(
            title: "فني صيانة",
            subtitle: "احصل على فرص عمل، تقييمات، وزود دخلك بسهولة",
            icon: Icons.build,
            onTap: () {},
          ),
          RoleCard(
            title: "أمثل شركة أو مطور عقاري",
            subtitle: "تعاون معنا في تنفيذ حمامات سباحة ذكية وخدمات المشاريع الكبرى",
            icon: Icons.business,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
