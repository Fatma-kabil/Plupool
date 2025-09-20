import 'package:flutter/cupertino.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/features/auth/data/models/role_card_item.dart';
import 'package:plupool/features/home/data/models/promo_card_model.dart';

final List<RoleCardItemModel> roles = [
  RoleCardItemModel(
    title: "صاحب حمام سباحة",
    subtitle: "احجز خدمات الإنشاء أو الصيانة و تابع حمامك \nبخدمات ذكية",
    image: 'assets/icons/user.svg',
  ),
  RoleCardItemModel(
    title: "فني صيانة",
    subtitle: "احصل على فرص عمل، تقييمات، وزود دخلك \nبسهولة",
    image: 'assets/icons/services.svg',
  ),
  RoleCardItemModel(
    title: "أمثل شركة أو مطور عقاري",
    subtitle: "تعاون معنا في تنفيذ حمامات سباحة ذكية \nوخدمات المشاريع الكبرى",
    image: 'assets/icons/buliding.svg',
  ),
];

final List<PromoCardModel> items = [
  PromoCardModel(
    title: "إنشاء حمامات السباحة",
    iconPath: "assets/icons/construct.svg",
    imagePath: "assets/images/phone.png",
    features: [
      "ضمان 10 سنين لأي إصلاح متعلق بإنشاء الحمام",
      "فترة صيانة مجانية تصل لمدة 3 شهور بعد الإنشاء",
      "ضمان لمدة 3 سنين على الطرمبات والموتاير",
    ],
   cardcolor: Color(0xffCCE4F0),
   textcolor: AppColors.kprimarycolor,
   titlecolor: Color(0xff006398),
    onButtonTap: () {
      // TODO: ضيفي الأكشن هنا
    },
  ),
  PromoCardModel(
    title: "إنشاء حمامات السباحة",
    iconPath: "assets/icons/construct.svg",
    imagePath: "assets/images/phone.png",
    features: [
      "ضمان 10 سنين لأي إصلاح متعلق بإنشاء الحمام",
      "فترة صيانة مجانية تصل لمدة 3 شهور بعد الإنشاء",
      "ضمان لمدة 3 سنين على الطرمبات والموتاير",
    ],
     cardcolor: Color(0xffCDF7EC),
    textcolor: Color(0xff048F6B),
    titlecolor:Color.fromARGB(255, 7, 194, 144) ,
    onButtonTap: () {
      // TODO: ضيفي الأكشن هنا
    },
  ),
  PromoCardModel(
    title: "إنشاء حمامات السباحة",
    iconPath: "assets/icons/construct.svg",
    imagePath: "assets/images/phone.png",
    features: [
      "ضمان 10 سنين لأي إصلاح متعلق بإنشاء الحمام",
      "فترة صيانة مجانية تصل لمدة 3 شهور بعد الإنشاء",
      "ضمان لمدة 3 سنين على الطرمبات والموتاير",
    ],
     cardcolor: Color(0xffCCE4F0),
   textcolor: AppColors.kprimarycolor,
 titlecolor: Color(0xff006398),
    onButtonTap: () {
      // TODO: ضيفي الأكشن هنا
    },
  ),
  // تقدر تكرري كروت تانية هنا
];
