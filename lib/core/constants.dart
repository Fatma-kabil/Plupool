import 'package:flutter/cupertino.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/features/auth/data/models/role_card_item.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';
import 'package:plupool/features/home/data/models/promo_card_model.dart';
import 'package:plupool/features/home/data/models/review_card_model.dart';

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
   
  ),
  PromoCardModel(
    title: "تصميم ثلاثي الأبعاد",
    iconPath: "assets/icons/design.svg",
    imagePath: "assets/images/promocard2.png",
    features: [
      "تجربة تصميم تفاعلي لحمام السباحة الخاص \nبك قبل التنفيذ، مع إمكانية مشاهدة جميع \nالتفاصيل في عرض ثلاثي الأبعاد واقعي",
    ],
    cardcolor: Color(0xffCDF7EC),
    textcolor: AppColors.kScenderycolor,
    titlecolor: AppColors.kScenderycolor,
   
  ),
  PromoCardModel(
    title: "  صيانة حمامات السباحة",
    iconPath: "assets/icons/services.svg",
    imagePath: "assets/images/promocrd3.png",
    features: [
      "تُعد صيانة حمامات السباحة مهمة جداً لضمان السلامة\nونظافه الحمام وموازنة كيماويات المياه. تشمل تنظيف \nالحمام، فحص الكلور والحمض، تنظيف الفلاتر، وصيانة \nالطلمبات.",
    ],
    cardcolor: Color(0xffFFECD2),
    textcolor: AppColors.kThiredColor,
    titlecolor:AppColors.kThiredColor,
    
  ),
  // تقدر تكرري كروت تانية هنا
];

final List<OfferModel> offers = [
  OfferModel(
    title: "عرض تنظيف",
    desc: "جلسة تنظيف مجانية عند حجز 3 جلسات",
    oldPrice: "2500 EGP",
    newPrice: "2000 EGP",
    image: "assets/images/offercard1.png",
    offerPercentage: '% خصم 10'
  ),
  OfferModel(
    title: "عرض صيانة",
    desc: " أول شهر صيانة مجاناً عند الاشتراك السنوي",
    oldPrice: "2000 EGP",
    newPrice: "1600 EGP",
    image: "assets/images/offercard2.png",
    offerPercentage: '% خصم 15'
  ),
  OfferModel(
    title: " عرض إنشاء",
    desc: " خصم 15% على أول حمام سباحة تنشئه معنا" ,
    oldPrice: "3000 EGP",
    newPrice: "2000 EGP",
    image: "assets/images/offercard3.png",
    offerPercentage: '% خصم 20'
  ),
];

final List<ProjectCardModel> projects = [
  ProjectCardModel(
    title: 'مشروع إنشاء حمام سباحة – فيلا التجمع',
    description: 'تصميم فاخر مع ضمان 10 سنوات وصيانة مجانية لمدة 3 شهور.',
    imageUrl: 'assets/images/project1.png',
  ),
  ProjectCardModel(
    title: 'صيانة حمام سباحة – نادي خاص',
    description: 'تنظيف وفحص كيميائي للمياه مرتين أسبوعياً للحفاظ على الجودة',
    imageUrl: 'assets/images/project2.png',
  ),
  ProjectCardModel(
    title: 'تصميم ثلاثي الأبعاد – حمام داخلي',
    description: 'معاينة تصميم الحمام بشكل واقعي قبل التنفيذ',
    imageUrl: 'assets/images/project3.png',
  ),
  ProjectCardModel(
    title: 'تنظيف حمام سباحة – خدمة دورية',
    description: 'تنظيف شامل للمياه والفلاتر والجدران للحفاظ على نقاء وجودة حمام السباحة.',
    imageUrl: 'assets/images/project4.png',
  ),
  // تقدر تضيف صور تانية هنا
];


final List<ReviewCardModel> reviews = [
 ReviewCardModel( name: "Ahmed Hassan",
      avatarUrl: "assets/images/user1.png",
      rating: 5,
      timeAgo: "2 days ago",
      comment: "خدمة ممتازة وفريق محترف جدًا",),
       ReviewCardModel(
      name: "Ali Ahmed",
      avatarUrl:  "assets/images/user2.png",
      rating: 4,
      timeAgo: "3 days ago",
      comment: "جودة عالية في التنفيذ والمتابعة",
    ),
];
