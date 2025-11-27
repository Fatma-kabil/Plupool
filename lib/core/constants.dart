import 'package:flutter/cupertino.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/features/profile/data/models/faq_item.dart';
import 'package:plupool/features/select_role/data/models/role_card_item.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';
import 'package:plupool/features/home/data/models/promo_card_model.dart';
import 'package:plupool/features/home/data/models/review_card_model.dart';
import 'package:plupool/features/consruction_service/data/models/pool_model.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/maintenance/data/models/maintenance_pool_model.dart';
import 'package:plupool/features/store/presentation/data/models/product_model.dart';

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
    title: "عرض تنظيف",
    desc: "جلسة تنظيف مجانية عند حجز 3 جلسات",
    oldPrice: "2500 EGP",
    newPrice: "2000 EGP",
    image: "assets/images/offercard1.png",
    offerPercentage: '% خصم 10',
  ),
  OfferModel(
    title: "عرض صيانة",
    desc: " أول شهر صيانة مجاناً عند الاشتراك السنوي",
    oldPrice: "2000 EGP",
    newPrice: "1600 EGP",
    image: "assets/images/offercard2.png",
    offerPercentage: '% خصم 15',
  ),
  OfferModel(
    title: " عرض إنشاء",
    desc: " خصم 15% على أول حمام سباحة تنشئه معنا",
    oldPrice: "3000 EGP",
    newPrice: "2000 EGP",
    image: "assets/images/offercard3.png",
    offerPercentage: '% خصم 20',
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
    timeAgo: "2 days ago",
    comment: "خدمة ممتازة وفريق محترف جدًا",
  ),
  ReviewCardModel(
    name: "Ali Ahmed",
    avatarUrl: "assets/images/user2.png",
    rating: 4,
    timeAgo: "3 days ago",
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
    title: "صيانة شهرية ",
    date: "2025-11-22",
    time: "11:00 ص",
    status: RequestStatus.inProgress,
    progress: 4,
    visits: 6,
    nextVisitDate: "2025-10-01",
    nextVisitDay: "الثلاثاء",
    nextVisitTime: "9:00 ص",
     userName: 'سارة حسن',
    userImage: 'assets/images/customer_user.png',
    location: 'المقطم، القاهرة',
  ),
  ServiceRequest(
    title: "صيانة الفلاتر",
    date: "2025-11-22",
    time: "11:00 ص",
    status: RequestStatus.scheduled,
     userName: 'سارة حسن',
    userImage: 'assets/images/customer_user.png',
    location: 'المقطم، القاهرة',
  ),
  ServiceRequest(
    title: 'عطل مفاجئ في المضخة',
    date: '2025-11-15',
    time: '1:00 م',
    userName: 'علي حسين',
    userImage: 'assets/images/ahmed.png',
    location: 'مدينة نصر، القاهرة',
    status: RequestStatus.urgent,
  ),
  ServiceRequest(
    title: 'صيانة شهرية',
    date: '2025-11-18',
    time: '11:00 ص',
    userName: 'سارة حسن',
    userImage: 'assets/images/customer_user.png',
    location: 'المقطم، القاهرة',
    status: RequestStatus.urgent,
    
  ),
  ServiceRequest(
    title: 'إصلاح نظام الفاتوره',
    date: '2025-11-15',
    time: '9:00 ص',
    userName: 'خالد محمود',
    userImage: 'assets/images/ahmed.png',
    location: 'المهندسين، الجيزة',
    status: RequestStatus.scheduled,
  ),
  ServiceRequest(
    title: 'إصلاح نظام الفاتوره',
    date: '2025-11-23',
    time: '9:00 ص',
    userName: 'خالد محمود',
    userImage: 'assets/images/ahmed.png',
    location: 'المهندسين، الجيزة',
    status: RequestStatus.scheduled,
  ),
  ServiceRequest(
    title: 'إصلاح نظام الفاتورة - ',
    date: '2025-11-14',
    time: '9:00 ص',
    userName: 'خالد محمود',
    userImage: 'assets/images/ahmed.png',
    location: 'المهندسين، الجيزة',
    status: RequestStatus.inProgress,
     progress: 0,
    visits: 4,
    nextVisitDate: "2025-12-01",
    nextVisitDay: "السبت",
    nextVisitTime: "9:00 ص",
  ),
  ServiceRequest(
    title: 'إصلاح نظام الفاتورة - ',
    date: '2025-11-24',
    time: '9:00 ص',
    userName: 'خالد محمود',
    userImage: 'assets/images/ahmed.png',
    location: 'المهندسين، الجيزة',
    status: RequestStatus.urgent,
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
      answer:
          "عند الضغط على الكارد الموجود فيه تفاصيل المهمة الخاصة بكل عميل.",
    ),
    FaqItem(
      question: "فين ألاقي تاريخ مشترياتي؟",
      answer:
          "من (المتجر) تقدر تلاقي علامة السلة ثم الضغط عليها.",
    ),
    FaqItem(
      question: "كيف أغير رقم الهاتف؟",
      answer:
          "تقدر تغير رقم الهاتف من (حسابي) ثم الضغط على معلومات الحساب ثم تعديل البيانات.",
    ),
  ];
