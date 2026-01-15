import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/features/home/data/models/drawer_item_model.dart';
import 'package:plupool/features/home/data/models/review_card_model.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/maintenance/data/models/maintenance_pool_model.dart';
import 'package:plupool/features/orders/data/models/order_card_model.dart';
import 'package:plupool/features/orders/domain/entities/order_status.dart';
import 'package:plupool/features/profile/data/models/faq_item.dart';
import 'package:plupool/features/profile/data/models/project_model.dart';
import 'package:plupool/features/select_role/data/models/role_card_item.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';
import 'package:plupool/features/home/data/models/promo_card_model.dart';
import 'package:plupool/features/consruction_service/data/models/pool_model.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/services/data/models/customer_service_card_model.dart';
import 'package:plupool/features/statistics/data/models/dashboard_item.dart';
import 'package:plupool/features/statistics/data/models/statistics_model.dart';
import 'package:plupool/features/store/data/models/dashboard_shortcut_model.dart';
import 'package:plupool/features/store/data/models/dashboard_statu_model.dart';
import 'package:plupool/features/store/data/models/product_model.dart';

import 'package:plupool/features/support/data/models/message_model.dart';

final List<RoleCardItemModel> roles = [
  RoleCardItemModel(
    title: "صاحب حمام سباحة",
    subtitle: "احجز خدمات الإنشاء أو الصيانة و تابع حمامك \nبخدمات ذكية",
    image: 'assets/icons/user.svg',
  ),
  RoleCardItemModel(
    title: "فني",
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
    titlecolor: AppColors.kThiredColor,
  ),
  // تقدر تكرري كروت تانية هنا
];

final List<OfferModel> offers = [
  OfferModel(
    title: "تركيب أنظمة الترشيح",
    desc: " تركيب أحدث أنظمة الترشيح والتطهير مع صيانة مجانية لمدة 6 أشهر.",
    endDate: DateTime(2025, 12, 20),
    startDate: DateTime(2025, 11, 20),
    image: "assets/images/safty.png",
    offerPercentage: '% خصم 15',
  ),
  OfferModel(
    title: "تركيب أنظمة الإضاءة",
    desc: "تركيب أنظمة إضاءة LED متطورة مع ألوان متعددة وتحكم عن بعد.",
    endDate: DateTime(2025, 12, 20),
    startDate: DateTime(2025, 11, 20),
    image: "assets/images/tech_offer2.png",
    offerPercentage: '% خصم 15',
  ),
  OfferModel(
    title: "تنظيف فلاتر المسبح",
    desc: "خدمة تنظيف فلاتر المسبح مع فحص شامل وضمان لمدة شهر.",
    endDate: DateTime(2025, 12, 20),
    startDate: DateTime(2025, 11, 20),
    image: "assets/images/offercard1.png",
    offerPercentage: '% خصم 10',
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
    description:
        'تنظيف شامل للمياه والفلاتر والجدران للحفاظ على نقاء وجودة حمام السباحة.',
    imageUrl: 'assets/images/project4.png',
  ),
  // تقدر تضيف صور تانية هنا
];

final List<ReviewCardModel> reviews = [
  ReviewCardModel(
    name: "Ahmed Hassan",
    avatarUrl: "assets/images/user1.png",
    rating: 5,
    timeAgo: "يومين",
    comment: "خدمة ممتازة وفريق محترف جدًا",
  ),
  ReviewCardModel(
    name: "Ali Ahmed",
    avatarUrl: "assets/images/user2.png",
    rating: 4,
    timeAgo: "3 ايام",
    comment: "جودة عالية في التنفيذ والمتابعة",
  ),
];
final Map<String, bool> options = {
  "طلمبات (24)": false,
  "فلاتر (38)": false,
  "سخانات (18)": false,
  "إكسسوارات (48)": false,
  "إكسسوارات (18)": false,
  "أدوات نظافة (18)": false,
  "كيماويات (10)": false,
  "قطع غيار (6)": false,
};

final List<ProductModel> products = [
  ProductModel(
    name: "frdrsdgxdadsfgkuytrewxcxvbnk,مضخة مياه عالية الكفاءة",
    image: "assets/images/mach_pro1.png",
    originalPrice: 3000,
    salesCount: 75,
    discountPercent: 20,
  ),
  ProductModel(
    name: "مضخة PluPool Pro 2000",
    image: "assets/images/mach_pro2.png",
    originalPrice: 2500,
    salesCount: 25,
    discountPercent: 5,
  ),
  ProductModel(
    name: "مضخة مياه عالية الكفاءة",
    image: "assets/images/mach_pro1.png",
    originalPrice: 40000,
    salesCount: 40,
    //   discountPercent: 20,
  ),
  ProductModel(
    name: "مضخة PluPool Pro 2000",
    image: "assets/images/mach_pro2.png",
    originalPrice: 200,
    salesCount: 35,

    //   discountPercent: 5,
  ),
  ProductModel(
    name: "مضخة مياه عالية الكفاءة",
    image: "assets/images/mach_pro1.png",
    originalPrice: 2800,
    salesCount: 85,
    //  discountPercent: 20,
  ),
  ProductModel(
    name: "مضخة PluPool Pro 2000",
    image: "assets/images/mach_pro2.png",
    originalPrice: 4100,
    salesCount: 4,
    discountPercent: 5,
  ),
];

final moods = [
  {"image": "assets/icons/relax.svg", "label": "Relax"},
  {"image": "assets/icons/romantic.svg", "label": "Romantic"},
  {"image": "assets/icons/party.svg", "label": "Party"},
  {"image": "assets/icons/night.svg", "label": "Night"},
];
final pools = [
  PoolModel(
    title: " حمام السباحة الأوفر فلو - Overflow Pool",

    description:
        "نظام متطور بيخلي المياه تنساب من كل الجوانب لحوض جانبي، وبترجع تاني للحمام بعد فلترتها.",
    features: [
      " مظهر فاخر وسطح مياه ثابت على مستوى الأرضية",
      " تنقية المياه باستمرار مما يعطي امانصحي اكثر وتقليل البكتيريا",
      "  مناسب لـ: الفيلات الفخمة، الفنادق، والمنتجعات السياحية.",
    ],
    videoUrl: "assets/videos/pool.mp4",

    // لاحظ هنا
  ),
  PoolModel(
    title: " حمام السباحة الاسكيمر - Skimmer Pool",
    description:
        "يعتمد على فتحات (Skimmers) بتسحب المياه السطحية للفلترة قبل ما ترجع للحمام.",
    features: [
      "أقل تكلفة وأسهل صيانة .",
      "مناسب لـ: المنازل الخاصة، الفلل المتوسطة، والمساحات الصغيرة.",
    ],
    videoUrl: "assets/videos/pool.mp4",

    // لاحظ هنا
  ),
  PoolModel(
    title: "الحمام الأوليمبي -  Pool Olympic",
    description: "حمام بمعايير قياسية يستخدم في المسابقات والتدريبات.",
    features: [
      "مثالي للرياضة والسباقات الرسمية.",
      "مناسب لـ: الأندية الرياضية، الجامعات، والمراكز التدريبية.",
    ],
    videoUrl: "assets/videos/pool.mp4",
  ),

  PoolModel(
    title: " (خارجي بفلتر حمام) Pools with External Filtration Unit",
    description: "بسيط واقتصادي مع وحدة فلترة خارجية.",
    features: [
      "الأرخص تكلفة.",
      "صيانة سهلة.",
      "مناسب لـ: الاستخدام الشخصي البسيط أو أماكن عامة صغيرة.",
    ],
    videoUrl: "assets/videos/pool.mp4",
  ),

  PoolModel(
    title: "حمام الأطفال- Pool Kids",
    description: "حمام صغير بعمق قليل مع أنظمة أمان مخصصة للأطفال.",
    features: [
      "أمان كامل ومناسب للعب الصغيرين.",
      "مناسب لـ: الحضانات، المدارس، والمنازل اللي فيها أطفال.",
    ],
    videoUrl: "assets/videos/pool.mp4",
  ),
  PoolModel(
    title: "Infinity Pool (Horizon)",
    description:
        "تصميم فاخر بيوهم إن المياه ممتدة بلا نهاية )زي إنها متصلة بالأفق أو البحر.(",
    features: [
      "مظهر بصري مذهل يضيف لمسة فخامة للمكان.",
      "مناسب لـ: الفيلات الفخمة، الفنادق، والمنتجعات السياحية المطلة على البحرأو الطبيعة.",
    ],
    videoUrl: "assets/videos/pool.mp4",
  ),
  PoolModel(
    title: "الحمام الداخلي- Pool Indoor ",
    description: "حمام سباحة مغطى داخل مبنى أو فيلا، محمي من العوامل الجوية.",
    features: [
      "استخدامه متاح طول السنة بدون تأثر بالطقس.",
      "مناسب لـ: الفلل، المنازل الخاصة، والمنتجعات الصحية Wellness) & .(Spa",
    ],
    videoUrl: "assets/videos/pool.mp4",
  ),
  PoolModel(
    title: "حمام الغطس الصغير-Pool Plunge",
    description: "حمام صغير الحجم مخصص للاسترخاء والتبريد مش للسباحة الطويلة.",
    features: [
      "اقتصادي ويوفر رفاهية في مساحات صغيرة.",
      "مناسب لـ: الشقق الأرضية، المساحات الصغيرة، أو بجوار ساونا/جاكوزي.",
    ],
    videoUrl: "assets/videos/pool.mp4",
  ),
  PoolModel(
    title: "حمام التدريب- Pool Lap ",
    description: "حمام ضيق وطويل مخصص للسباحة الرياضية واللياقة.",
    features: [
      "تصميم عملي للتمرين والحفاظ على اللياقة.",
      "مناسب لـ: الرياضيين، المنازل الخاصة اللي أصحابها مهتمين بالرياضة.",
    ],
    videoUrl: "assets/videos/pool.mp4",
  ),
];

final maintenancePools = [
  MaintenancePoolModel(
    title: " 1. التنظيف Cleaning",
    imageUrl: "assets/images/cleanning.png",
    features: [
      "تنظيف شامل.",
      "إزالة الشوائب العائمة.",
      "تنظيف الأرضيات.",
      "إزالة الرواسب وتلميع الجدران.",
      "مكافحة الطحالب.",
      "تعقيم دوري شامل للحفاظ على الأمان.",
    ],
  ),
  MaintenancePoolModel(
    title: " 2. جودة المياه Water Quality",
    imageUrl: "assets/images/water_quality.png",
    features: [
      "ضبط الكلور.",
      "توازن الـ PH.",
      "ضبط مستوى المياه.",
      "تغيير المياه للحفاظ على مستوى النقاء.",
    ],
  ),
  MaintenancePoolModel(
    title: "  3. المعدات Equipment Maintenance",
    imageUrl: "assets/images/equipment.png",
    features: [
      "فحص الفلاتر.",
      "صيانة المضخات.",
      "تنظيف المواسير وخطوط الفلترة.",
      "متابعة لوحة التحكم.",
    ],
  ),
  MaintenancePoolModel(
    title: "  4. الإضافات والرفاهية Extras",
    imageUrl: "assets/images/extra.png",
    features: ["تنظيف الشلالات.", "خدمة الجاكوزي."],
  ),
  MaintenancePoolModel(
    title: " 5. الأمان والوقاية Safety & Emergency",
    imageUrl: "assets/images/safty.png",
    features: [
      "مواد آمنة.",
      "كشف أعطال مبكر.",
      "صيانة وقائية.",
      "طوارئ فورية.",
    ],
  ),
];

final List<List<String>> services = [
  [
    "3 شهور صيانة مجاناً",
    "تنظيف شامل",
    "معالجة المياه",
    "صيانة المعدات",
    "مراجعة التسريبات البسيطة",
  ],
  [
    "شهر صيانة مجاناً",
    "تنظيف شامل",
    "معالجة المياه",
    "صيانة المعدات",
    "مراجعة التسريبات البسيطة",
  ],
  ["تنظيف شامل", "معالجة المياه", "صيانة المعدات", "مراجعة التسريبات البسيطة"],
];
final List<ServiceRequest> requests = [
  ServiceRequest(
    endTime: "2025-12-30",
    title: "صيانة شهرية ",
    date: "2025-12-22",
    packageType: "الباقة الشهرية",
    time: "11:00 ص",
    status: RequestStatus.inProgress,
    progress: 2,
    visits: 6,
    nextVisitDate: "2025-01-01",
    nextVisitDay: "الثلاثاء",
    nextVisitTime: "9:00 ص",
    userName: 'سارة حسن',
    userImage: 'assets/images/customer_user.png',
    location: 'المقطم، القاهرة',
  ),
  ServiceRequest(
    endTime: "2025-12-30",
    title: "صيانة شهرية ",
    date: "2025-12-22",
    packageType: "الباقة الشهرية",
    time: "11:00 ص",
    status: RequestStatus.inProgress,
    progress: 2,
    visits: 12,
    nextVisitDate: "2025-01-01",
    nextVisitDay: "الثلاثاء",
    nextVisitTime: "9:00 ص",
    userName: 'أحمد حسن',
    userImage: 'assets/images/customer_user.png',
    location: 'المقطم، القاهرة',
  ),
  ServiceRequest(
    endTime: "2025-12-30",
    title: "صيانة شهرية ",
    date: "2025-12-22",
    packageType: "الباقة الشهرية",
    time: "11:00 ص",
    status: RequestStatus.inProgress,
    progress: 2,
    visits: 6,
    nextVisitDate: "2025-01-01",
    nextVisitDay: "الثلاثاء",
    nextVisitTime: "9:00 ص",
    userName: 'عماد حسن',
    userImage: 'assets/images/customer_user.png',
    location: 'المقطم، القاهرة',
  ),
  ServiceRequest(
    endTime: "2025-04-01",
    packageType: "باقة (6 شهور)",
    title: "صيانة الفلاتر",
    date: "2025-12-18",
    time: "11:00 ص",
    status: RequestStatus.scheduled,
    progress: 0,
    visits: 6,
    nextVisitDate: "2025-12-19",
    nextVisitDay: "الثلاثاء",
    nextVisitTime: "9:00 ص",
    userName: 'سارة حسن',
    userImage: 'assets/images/customer_user.png',
    location: 'المقطم، القاهرة',
  ),
  ServiceRequest(
    title: 'عطل مفاجئ في المضخة',
    date: '2025-12-18',
    time: '1:00 م',
    userName: 'علي حسين',
    userImage: 'assets/images/ahmed.png',
    location: 'مدينة نصر، القاهرة',
    status: RequestStatus.urgent,
  ),
  ServiceRequest(
    title: 'صيانة شهرية',
    date: '2025-12-18',
    time: '11:00 ص',
    userName: 'سارة حسن',
    userImage: 'assets/images/customer_user.png',
    location: 'المقطم، القاهرة',
    status: RequestStatus.urgent,
  ),
  ServiceRequest(
    title: 'إصلاح نظام الفاتوره',
    date: '2025-12-19',
    time: '9:00 ص',
    userName: 'خالد محمود',
    userImage: 'assets/images/ahmed.png',
    location: 'المهندسين، الجيزة',
    status: RequestStatus.scheduled,
    visits: 4,
  ),
  ServiceRequest(
    title: 'إصلاح نظام الفاتوره',
    date: '2025-12-23',
    time: '9:00 ص',
    userName: 'خالد محمود',
    userImage: 'assets/images/ahmed.png',
    location: 'المهندسين، الجيزة',
    status: RequestStatus.scheduled,
    visits: 10,
  ),
  ServiceRequest(
    title: 'إصلاح نظام الفاتورة - ',
    date: '2025-12-24',
    time: '9:00 ص',
    userName: 'خالد محمود',
    userImage: 'assets/images/ahmed.png',
    location: 'المهندسين، الجيزة',
    status: RequestStatus.urgent,

    nextVisitDate: "2025-01-01",
    nextVisitDay: "السبت",
    nextVisitTime: "9:00 ص",
  ),
  ServiceRequest(
    title: 'إصلاح نظام الفاتورة - ',
    date: '2025-01-15',
    endTime: '2025-02-15',
    packageType: "باقة (4 شهور)",
    progress: 6,
    visits: 6,
    time: '9:00 ص',
    userName: 'خالد محمود',
    userImage: 'assets/images/ahmed.png',
    location: 'المهندسين، الجيزة',
    status: RequestStatus.completed,
  ),
];

final List<OfferModel> equipmentOffers = [
  OfferModel(
    title: "معدات صيانة ",
    desc: "طلمبة فلترة",
    oldPrice: "2500 EGP",
    newPrice: "2000 EGP",
    image: "assets/images/mach_pro1.png",
    offerPercentage: '% خصم 10',
  ),
  OfferModel(
    title: "معدات إنشاء",
    desc: "مجموعة إضاءة LED للمسابح",
    oldPrice: "2000 EGP",
    newPrice: "1600 EGP",
    image: "assets/images/tech_offer2.png",
    offerPercentage: '% خصم 15',
  ),

  OfferModel(
    title: "مواد كيميائية آمنة",
    desc: "مواد كيميائية آمنة",
    oldPrice: "3000 EGP",
    newPrice: "2000 EGP",
    image: "assets/images/tech_offer3.png",
    offerPercentage: '% خصم 20',
  ),
];

final List<FaqItem> techQes = [
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
    answer: "عند الضغط على الكارد الموجود فيه تفاصيل المهمة الخاصة بكل عميل.",
  ),
  FaqItem(
    question: "فين ألاقي تاريخ مشترياتي؟",
    answer: "من (المتجر) تقدر تلاقي علامة السلة ثم الضغط عليها.",
  ),
  FaqItem(
    question: "كيف أغير رقم الهاتف؟",
    answer:
        "تقدر تغير رقم الهاتف من (حسابي) ثم الضغط على معلومات الحساب ثم تعديل البيانات.",
  ),
];

final List<FaqItem> ownerQes = [
  FaqItem(
    question: "كيف أطلب خدمة صيانة جديدة؟",
    answer:
        "تقدر تطلب خدمة صيانة من خلال الدخول على قسم الخدمات ، ثم أضغط علي “أطلب الصيانة” ، ثم الضغط على “أحجز الخدمة الان”، واختيار الوقت المناسب للتواصل ، وهيتم تسجيل الطلب.",
  ),
  FaqItem(
    question: "لو المنتج طلع فيه مشكلة؟",
    answer: "تواصل مع الدعم من صفحة “مركز المساعدة ” الموجودة في “حسابي”.",
  ),
  FaqItem(
    question: "هل أقدر أتابع الشغل المستمر؟",
    answer:
        "أيوة، تقدر تتابع تقدم الباقة من خلال الـProgress Bar في البروفايل ثم الضغط علي خدماتي او باقاتي أو من صفحة “مسبحي”.",
  ),
  FaqItem(
    question: "فين ألاقي تاريخ مشترياتي؟",
    answer: "من (المتجر) تقدر تلاقي علامة السلة ثم الضغط عليها.",
  ),
  FaqItem(
    question: " هل أستطيع حذف حسابي؟",
    answer: "أيوه، تقدر تحذف حسابك من خلال حسابي ثم الضغط علي حذف الحساب.",
  ),
];

final List<ProjectModel> projs = [
  ProjectModel(
    title: "مشروع النخيل السكني",
    location: "القاهرة الجديدة",
    nofpools: 12,
    progress: 75,
    nextVisitDate: "1/10/2025",
    nextVisitDay: "الثلاثاء",
    nextVisitTime: "9:00 ص",
    status: RequestStatus.inProgress,
  ),
  ProjectModel(
    title: "مشروع واحه الرياض",
    location: "الشيخ زايد",
    nofpools: 8,
    progress: 0,
    status: RequestStatus.scheduled,
  ),
  ProjectModel(
    title: "مشروع ريفيرا الساحل",
    location: "الساحل الشمالي",
    nofpools: 6,
    progress: 100,
    status: RequestStatus.completed,
  ),
];

final List<DrawerItemModel> observations = [
  DrawerItemModel(
    icon: Icons.analytics,
    title: "الإحصائيات",
    onTap: '/statisticsview',
  ),
  DrawerItemModel(
    icon: Icons.local_offer,
    title: "العروض",
    onTap: '/offerview',
  ),
  DrawerItemModel(
    icon: Icons.support_agent,
    title: "الدعم",
    onTap: '/adminsupportview',
  ),
  DrawerItemModel(icon: Icons.store, title: "المتجر", onTap: '/adminstoreview'),
  DrawerItemModel(
    icon: Icons.rate_review,
    title: "التقييمات",
    onTap: '/statisticsview',
  ),
  DrawerItemModel(
    icon: Icons.badge,
    title: "ممثل الشركة",
    onTap: '/statisticsview',
  ),
];

final List<StatisticsModel> Statistics = [
  StatisticsModel(
    backColor: Color(0xffCCF0F7),
    iconColor: Color(0xff00B4D8),
    count: 32,
    icon: Icons.shopping_cart,
    title: "طلبات المتجر",
  ),
  StatisticsModel(
    backColor: Color(0xffFFECD2),
    iconColor: Color(0xffFF9F1C),
    count: 42,
    icon: Icons.layers_outlined,
    title: "الباقات النشطة",
  ),
  StatisticsModel(
    backColor: Color(0xffCDF7EC),
    iconColor: Color(0xff05B285),
    count: 18,
    icon: Icons.pending_actions,
    title: "الطلبات الجارية",
  ),
  StatisticsModel(
    backColor: Color(0xffFAD7DA),
    iconColor: Color(0xffEA5A65),
    count: 8,
    icon: Icons.flag_outlined,
    title: "البلاغات",
  ),
  StatisticsModel(
    backColor: Color(0xffB7FFC9),
    iconColor: Color(0xff75CD55),
    count: 142,
    icon: Icons.people_outline,
    title: "العملاء",
  ),
  StatisticsModel(
    backColor: Color(0xffDAF5FA),
    iconColor: Color(0xff60959F),
    count: 15,
    icon: Icons.engineering_outlined,
    title: "الفنيين",
  ),
];
final dashboarditems = [
  DashboardItem(
    count: 100,
    title: 'العملاء النشطين',
    icon: Icons.person,
    iconBgColor: Color(0xffCDF7EC),
    iconColor: Color(0xff05B285),
  ),
  DashboardItem(
    count: 100,
    title: 'الباقات المتجددة',
    icon: Icons.sync_alt,
    iconBgColor: Color(0xffCDF7EC),
    iconColor: Color(0xff05B285),
  ),
  DashboardItem(
    count: 80,
    title: 'العملاء غير النشطين',
    icon: Icons.person_off,
    iconBgColor: Color(0xffFAD7DA),
    iconColor: Color(0xffEA5A65),
  ),
  DashboardItem(
    count: 80,
    title: 'الباقات غير المتجددة',
    icon: Icons.description,
    iconBgColor: Color(0xffFAD7DA),
    iconColor: Color(0xffEA5A65),
  ),
];

final List<Map> customerFooter = [
  {
    'icon': Icons.layers_outlined,
    'title': "الباقات والخدمات",
    'color': Color(0xff05B285),
    'view': '/customerservicesview',
  },
  {
    'icon': Icons.star_outlined,
    'title': "التقييمات",
    'color': Color(0xffFF9F1C),
    'view': '/customerservicesview',
  },
  {
    'icon': Icons.flag,
    'title': "البلاغات ورسائل الدعم",
    'color': Color(0xffEA5A65),
    'view': '/customerservicesview',
  },
  {
    'icon': Icons.shopping_cart_outlined,
    'title': "طلبات المتجر",
    'color': AppColors.kprimarycolor,
    'view': '/customerservicesview',
  },
  {
    'icon': Icons.note_alt_outlined,
    'title': "الملاحظات",
    'color': Color(0xff7B7B7B),
    'view': '/customerservicesview',
  },
];

final List<CustomerServiceCardModel> customerServices = [
  CustomerServiceCardModel(
    orderno: "56489",
    date: DateTime(2025, 12, 14),
    service: "صيانة الفلتر",
    techs: "علي حسين، محمد أحمد",
    statu: RequestStatus.urgent,
  ),
  CustomerServiceCardModel(
    orderno: "56489",
    date: DateTime(2025, 12, 14),
    service: "صيانة الفلتر",
    techs: "علي حسين، محمد أحمد",
    statu: RequestStatus.scheduled,
  ),
  CustomerServiceCardModel(
    orderno: "56489",
    date: DateTime(2025, 12, 14),
    service: "صيانة الفلتر",
    techs: "علي حسين، محمد أحمد",
    statu: RequestStatus.completed,
  ),
];

final List<MessageModel> messages = [
  MessageModel(
    role: "عميل",
    name: "محمد رامي",
    message:
        "إزاي أجدّد الباقة؟"
        "هل أقدر أغير موعد الزيارة؟",
    status: MessageStatus.pending,
    files: true,
  ),
  MessageModel(
    role: "فني",
    name: "محمد عبده",
    message:
        "إزاي أجدّد الباقة؟"
        "هل أقدر أغير موعد الزيارة؟",
    status: MessageStatus.pending,
  ),
  MessageModel(
    role: "عميل",
    name: "محمد رامي",
    message:
        "إزاي أجدّد الباقة؟"
        "هل أقدر أغير موعد الزيارة؟",
    status: MessageStatus.solved,
  ),
];

final List<DashboardStatModel> dashboardStats = [
  DashboardStatModel(
    title: "التقييم",
    value: "4.8",
    icon: Icons.star_outline,
    backgroundColor: Color(0xffFFECD2),
    iconColor: Color(0xffFF9F1C),
  ),
  DashboardStatModel(
    title: "عدد الطلبات",
    value: "+100",
    icon: Icons.shopping_cart_outlined,
    backgroundColor: Color(0xffCCE4F0),
    iconColor: Color(0xff0077B6),
  ),
  DashboardStatModel(
    title: "عدد المنتجات",
    value: "+150",
    icon: Icons.inventory_2_outlined,
    backgroundColor: Color(0xffCDF7EC),
    iconColor: Color(0xff05B285),
  ),
  DashboardStatModel(
    title: "عروض نشطة",
    value: "5",
    icon: Icons.trending_up,
    backgroundColor: Color(0xffFAD7DA),
    iconColor: Color(0xffEA5A65),
  ),
];

final List<DashboardShortcutModel> dashboardShortcuts = [
  DashboardShortcutModel(
    title: "الطلبات",
    icon: Icons.shopping_cart_outlined,
    color: Color(0xff0077B6),
    onTap: '/storeorderview',
  ),
  DashboardShortcutModel(
    title: "المنتجات",
    icon: Icons.inventory_2_outlined,
    color: Color(0xffFF9F1C),
    onTap: '/storeorderview',
  ),
  DashboardShortcutModel(
    title: "العروض",
    icon: Icons.local_offer_outlined,
    color: Color(0xffEA5A65),
    onTap: '/storeorderview',
  ),
  DashboardShortcutModel(
    title: "المخزون",
    icon: Icons.warehouse_outlined,
    color: Color(0xff05B285),
    onTap: '/storeorderview',
  ),
];

final List<OrderCardModel> orderCards = [
  OrderCardModel(
    date: DateTime(2025, 5, 12, 11, 00),
    orderNo: 12345,
    satus: OrderStatus.delivered,
    note: "تم تسليم الطلب",
  ),
  OrderCardModel(
    date: DateTime(2025, 5, 12, 11, 00),
    orderNo: 12345,
    satus: OrderStatus.delivered,
    note: "تم تسليم الطلب",
  ),
  OrderCardModel(
    date: DateTime(2025, 5, 12, 11, 00),
    orderNo: 12345,
    satus: OrderStatus.delivered,
    note: "تم تسليم الطلب",
  ),
  OrderCardModel(
    date: DateTime(2025, 5, 12, 11, 00),
    orderNo: 12345,
    satus: OrderStatus.onTheWay,

  ),
   OrderCardModel(
    date: DateTime(2025, 5, 12, 11, 00),
    orderNo: 12345,
    satus: OrderStatus.preparing,
   
  ),
   OrderCardModel(
    date: DateTime(2025, 5, 12, 11, 00),
    orderNo: 12345,
    satus: OrderStatus.cancelled,
    note: "لم يستلم العميل الطلب من المندوب"
   
  ),
   OrderCardModel(
    date: DateTime(2025, 5, 12, 11, 00),
    orderNo: 12345,
    satus: OrderStatus.cancelled,
    note: "لم يستلم العميل الطلب من المندوب"
   
  ),
  
];
