import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/features/contact_us/data/models/contact_us_model.dart';
import 'package:plupool/features/home/data/models/drawer_item_model.dart';
import 'package:plupool/features/maintenance/data/models/requested_maintenance_card_model.dart';
import 'package:plupool/features/notifications/data/models/notifiction_type_model.dart';

import 'package:plupool/features/projects/data/models/admin_project_model.dart';
import 'package:plupool/features/select_role/data/models/role_card_item.dart';
import 'package:plupool/features/home/data/models/promo_card_model.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/services/data/models/customer_service_card_model.dart';
import 'package:plupool/features/statistics/data/models/dashboard_item.dart';
import 'package:plupool/features/statistics/data/models/statistics_model.dart';
import 'package:plupool/features/store/data/models/dashboard_shortcut_model.dart';
import 'package:plupool/features/store/data/models/dashboard_statu_model.dart';

final List<RoleCardItemModel> roles = [
  RoleCardItemModel(
    title: "صاحب حمام سباحة",
    subtitle: "احجز خدمات الإنشاء أو الصيانة و تابع حمامك بخدمات ذكية",
    image: Icons.pool,
  ),
  RoleCardItemModel(
    title: "فني",
    subtitle: "احصل على فرص عمل، تقييمات، وزود دخلك بسهولة",
    image: Icons.handyman_outlined,
  ),
  RoleCardItemModel(
    title: "ممثل شركة أو مطور عقاري",
    subtitle: "تعاون معنا في تنفيذ حمامات سباحة ذكية وخدمات المشاريع الكبرى",
    image: Icons.business,
  ),
  RoleCardItemModel(
    title: "ادمن",
    subtitle: " إدارة النظام والمستخدمين والخدمات",
    image: Icons.admin_panel_settings_outlined,
  ),
];

final List<PromoCardModel> items = [
  PromoCardModel(
    title: "إنشاء حمامات السباحة",
    iconPath: "assets/icons/construct.svg",
    imagePath: "assets/images/promocard1.png",
    features: [
      "ضمان 10 سنين لأي إصلاح متعلق بإنشاء الحمام",
      "فترة صيانة مجانية تصل لمدة 3 شهور بعد الإنشاء",
      "ضمان لمدة 3 سنين على الطرمبات والموتاير",
    ],
    cardcolor: Color(0xffCCE4F0),
    textcolor: AppColors.kprimarycolor,
    titlecolor: Color(0xff006398),
    path: "/constructionservicesview",
  ),

  PromoCardModel(
    title: "  صيانة حمامات السباحة",
    iconPath: "assets/icons/services.svg",
    imagePath: "assets/images/promocard2.png",
    features: [
      "تُعد صيانة حمامات السباحة مهمة جداً لضمان السلامةونظافه الحمام وموازنة كيماويات المياه. تشمل تنظيف الحمام، فحص الكلور والحمض، تنظيف الفلاتر، وصيانة الطلمبات.",
    ],
    cardcolor: Color(0xffCDF7EC),
    textcolor: AppColors.kScenderycolor,
    titlecolor: AppColors.kScenderycolor,
    path: "/maintenanceserviceview",
  ),
  // تقدر تكرري كروت تانية هنا
];

final moods = [
  {"image": "assets/icons/relax.svg", "label": "Relax"},
  {"image": "assets/icons/romantic.svg", "label": "Romantic"},
  {"image": "assets/icons/party.svg", "label": "Party"},
  {"image": "assets/icons/night.svg", "label": "Night"},
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
    onTap: '/adminratingview',
  ),
  DrawerItemModel(
    icon: Icons.badge,
    title: "ممثل الشركة",
    onTap: '/companyresview',
  ),
];

final List<StatisticsModel> Statistics = [
  StatisticsModel(
    backColor: Color(0xffCCF0F7),
    iconColor: Color(0xff00B4D8),

    icon: Icons.shopping_cart,
    title: "طلبات المتجر",
  ),
  StatisticsModel(
    backColor: Color(0xffFFECD2),
    iconColor: Color(0xffFF9F1C),

    icon: Icons.layers_outlined,
    title: "الباقات النشطة",
  ),
  StatisticsModel(
    backColor: Color(0xffCDF7EC),
    iconColor: Color(0xff05B285),

    icon: Icons.pending_actions,
    title: "الطلبات الجارية",
  ),
  StatisticsModel(
    backColor: Color(0xffFAD7DA),
    iconColor: Color(0xffEA5A65),

    icon: Icons.flag_outlined,
    title: "البلاغات",
  ),
  StatisticsModel(
    backColor: Color(0xffB7FFC9),
    iconColor: Color(0xff75CD55),

    icon: Icons.people_outline,
    title: "العملاء",
  ),
  StatisticsModel(
    backColor: Color(0xffDAF5FA),
    iconColor: Color(0xff60959F),

    icon: Icons.engineering_outlined,
    title: "الفنيين",
  ),
];
final dashboarditems = [
  DashboardItem(
    title: 'العملاء النشطين',
    icon: Icons.person,
    iconBgColor: Color(0xffCDF7EC),
    iconColor: Color(0xff05B285),
  ),
  DashboardItem(
    title: 'الباقات المتجددة',
    icon: Icons.sync_alt,
    iconBgColor: Color(0xffCDF7EC),
    iconColor: Color(0xff05B285),
  ),
  DashboardItem(
    title: 'العملاء غير النشطين',
    icon: Icons.person_off,
    iconBgColor: Color(0xffFAD7DA),
    iconColor: Color(0xffEA5A65),
  ),
  DashboardItem(
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
    'view': '/customerratingview',
  },
  {
    'icon': Icons.flag,
    'title': "البلاغات ورسائل الدعم",
    'color': Color(0xffEA5A65),
    'view': '/techpoolownercontactusView',
  },
  {
    'icon': Icons.shopping_cart_outlined,
    'title': "طلبات المتجر",
    'color': AppColors.kprimarycolor,
    'view': '/customerstoreorderview',
  },
  {
    'icon': Icons.note_alt_outlined,
    'title': "الملاحظات",
    'color': Color(0xff7B7B7B),
    'view': '/companyresnotesview',
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
    statu: RequestStatus.urgent,
  ),
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

final List<DashboardStatModel> dashboardStats = [
  DashboardStatModel(
    title: "التقييم",

    icon: Icons.star_outline,
    backgroundColor: Color(0xffFFECD2),
    iconColor: Color(0xffFF9F1C),
  ),
  DashboardStatModel(
    title: "عدد الطلبات",

    icon: Icons.shopping_cart_outlined,
    backgroundColor: Color(0xffCCE4F0),
    iconColor: Color(0xff0077B6),
  ),
  DashboardStatModel(
    title: "عدد المنتجات",

    icon: Icons.inventory_2_outlined,
    backgroundColor: Color(0xffCDF7EC),
    iconColor: Color(0xff05B285),
  ),
  DashboardStatModel(
    title: "عروض نشطة",

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
    onTap: '/productview',
  ),
  DashboardShortcutModel(
    title: "العروض",
    icon: Icons.local_offer_outlined,
    color: Color(0xffEA5A65),
    onTap: '/productofferview',
  ),
];

final List<Map> companyresFooter = [
  {
    'icon': Icons.work_outline,
    'title': "المشاريع",
    'color': Color(0xff0096B4),
    'view': '/companyresprojectview',
  },
  {
    'icon': Icons.people_alt_rounded,
    // Icons.groups_rounded
    'title': "العملاء",
    'color': Color(0xff0096B4),
    'view': '/companyresclientsview',
  },
  {
    'icon': Icons.star_outlined,
    'title': "التقييمات",
    'color': Color(0xffFF9F1C),
    'view': '/customerratingview',
  },
  {
    'icon': Icons.headset_mic,
    'title': "البلاغات ورسائل الدعم وتواصل معنا",
    'color': Color(0xffEA5A65),
    'view': '/companyrescontactusview',
  },
  {
    'icon': Icons.shopping_cart_outlined,
    'title': "طلبات المتجر",
    'color': AppColors.kprimarycolor,
    'view': '/customerstoreorderview',
  },
  {
    'icon': Icons.note_alt_outlined,
    'title': "الملاحظات",
    'color': Color(0xff7B7B7B),
    'view': '/companyresnotesview',
  },
];

final List<NotificationType> notificationTypes = [
  NotificationType(
    title: 'إشعار عام',
    type: 'general',
    icon: Icons.notifications_active_outlined,
  ),
  NotificationType(
    title: 'انتهاء الباقة',
    type: 'package_expiry',
    icon: Icons.workspace_premium_outlined,
  ),
  NotificationType(
    title: 'غياب فني',
    type: 'technician_absence',
    icon: Icons.person_off_outlined,
  ),
  NotificationType(
    title: 'رسالة جديدة',
    type: 'new_message',
    icon: Icons.mark_chat_unread_outlined,
  ),
  NotificationType(
    title: 'طلب صيانة',
    type: 'maintenance_request',
    icon: Icons.build_outlined,
  ),
  NotificationType(
    title: 'تقييم الخدمة',
    type: 'service_rating',
    icon: Icons.star_outline,
  ),
  NotificationType(
    title: 'إنشاء حساب جديد',
    type: 'new_account',
    icon: Icons.person_add_alt_1_outlined,
  ),
];



final List<ContactUsModel> companyContactUs = [
  ContactUsModel(
    companyName: "شركة التقنية المتطورة",
    companyRes: "أحمد محمد",
    message: "هل تقدمون خدمات بناء حمامات سباحة؟",
    messageDate: DateTime(2025, 5, 4),
    phone: "01558098364",
    projectType: "بناء حمامات سباحة",
    status: MessageStatus.pending_review,
  ),
  ContactUsModel(
    companyName: "شركة التقنية المتطورة",
    companyRes: "أحمد محمد",
    message: "هل تقدمون خدمات بناء حمامات سباحة؟",
    messageDate: DateTime(2025, 5, 4),
    phone: "01558098364",
    projectType: "بناء حمامات سباحة",
    status: MessageStatus.pending_review,
  ),
  ContactUsModel(
    companyName: "شركة التقنية المتطورة",
    companyRes: "أحمد محمد",
    message: "هل تقدمون خدمات بناء حمامات سباحة؟",
    messageDate: DateTime(2025, 5, 4),
    phone: "01558098364",
    projectType: "بناء حمامات سباحة",
    status: MessageStatus.pending_review,
  ),
  ContactUsModel(
    companyName: "شركة التقنية المتطورة",
    companyRes: "أحمد محمد",
    message: "هل تقدمون خدمات بناء حمامات سباحة؟",
    messageDate: DateTime(2025, 5, 4),
    phone: "01558098364",
    projectType: "بناء حمامات سباحة",
    status: MessageStatus.pending_review,
  ),
  ContactUsModel(
    companyName: "شركة التقنية المتطورة",
    companyRes: "أحمد محمد",
    message: "هل تقدمون خدمات بناء حمامات سباحة؟",
    messageDate: DateTime(2025, 5, 4),
    phone: "01558098364",
    projectType: "بناء حمامات سباحة",
    status: MessageStatus.pending_review,
  ),
  ContactUsModel(
    companyName: "شركة التقنية المتطورة",
    companyRes: "أحمد محمد",
    message: "هل تقدمون خدمات بناء حمامات سباحة؟",
    messageDate: DateTime(2025, 5, 4),
    phone: "01558098364",
    projectType: "بناء حمامات سباحة",
    status: MessageStatus.resolved,
  ),
];

final List<RequestedMaintenanceCardModel> requestedMaintenanceCards = [
  RequestedMaintenanceCardModel(
    name: "عاصم محمود",
    role: "عميل",
    statu: 'جديد',
    service: 'صيانة الفلتر',
  ),
  RequestedMaintenanceCardModel(
    name: "أحمد محمود",
    role: "ممثل شركه",
    statu: 'جديد',
    service: 'باقه شهرية',
  ),
  RequestedMaintenanceCardModel(
    name: "عاصم محمود",
    role: "عميل",
    statu: 'تم التواصل',
    service: 'صيانة الفلتر',
  ),
  RequestedMaintenanceCardModel(
    name: "أحمد محمود",
    role: "ممثل شركه",
    statu: 'تم التواصل',
    service: 'باقه شهرية',
  ),
];

final List<Map<String, dynamic>> adminNotification = [
  {
    "type": "report",
    "title": "بلاغ عميل جديد",
    "subtitle": "أبلغ العميل محمد كمال عن غياب الفني",
    "time": "منذ يوم ",
  },
  {
    "type": "support",
    "title": "رسالة دعم جديدة",
    "subtitle": "أرسل العميل خالد محمد رسالة جديدة",
    "time": "منذ يوم ",
  },
  {
    "type": "order",
    "title": "طلب خدمة",
    "subtitle": "أرسل العميل خالد محمد طلب خدمة جديدة",
    "time": "منذ يوم ",
    "ordertype": "serviceOrder",
  },
  {
    "type": "message",
    "title": "رسالة  جديدة",
    "subtitle": "أرسل العميل خالد محمد رسالة  جديدة",
    "time": "منذ يوم ",
  },
  {
    "type": "reminder",
    "title": "تنبيه مخزون منخفض",
    "subtitle": "المنتج” فلتر ماء” وصل لحد التنبيه",
    "time": "منذ يوم ",
  },
  {
    "type": "order",
    "title": "طلب متجر",
    "subtitle": "هناك طلب جديد من المتجر",
    "time": "منذ يوم ",
    "ordertype": "storeOreder",
  },
];
const notificationFilters = {
  "all": {"label": "الكل"},
  "requests": {"label": "الطلبات"},
  "offers": {"label": "العروض"},
  "inventory": {"label": "المخزون"},
  "reports": {"label": "البلاغات"},
  "ratings": {"label": "التقييمات"},
  "reminders": {"label": "التذكيرات"},
  "general": {"label": "العامة"},
};
final List<Map> techFooter = [
  {
    'icon': Icons.task_outlined,
    'title': "المهام",
    'color': Color(0xff05B285),
    'view': '/customerservicesview',
  },

  {
    'icon': Icons.flag,
    'title': "الشكاوي ورسائل الدعم",
    'color': Color(0xffEA5A65),
    'view': '/techpoolownercontactusView',
  },
  {
    'icon': Icons.shopping_cart_outlined,
    'title': "طلبات المتجر",
    'color': AppColors.kprimarycolor,
    'view': '/customerstoreorderview',
  },
  {
    'icon': Icons.note_alt_outlined,
    'title': "الملاحظات",
    'color': Color(0xff7B7B7B),
    'view': '/companyresnotesview',
  },
];
