import 'package:flutter/material.dart';
import 'package:plupool/features/auth/data/models/role_card_item.dart';

final List<RoleCardItemModel> roles = [
  RoleCardItemModel(
    title: "صاحب حمام سباحة",
    subtitle: "احجز خدمات الإنشاء أو الصيانة و تابع حمامك \nبخدمات ذكية",
    icon: Icons.person,
  ),
  RoleCardItemModel(
    title: "فني صيانة",
    subtitle: "احصل على فرص عمل، تقييمات، وزود دخلك \nبسهولة",
    icon: Icons.build,
  ),
  RoleCardItemModel(
    title: "أمثل شركة أو مطور عقاري",
    subtitle: "تعاون معنا في تنفيذ حمامات سباحة ذكية \nوخدمات المشاريع الكبرى",
    icon: Icons.business,
  ),
];
