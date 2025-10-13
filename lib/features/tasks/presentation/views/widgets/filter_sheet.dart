import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'filter_section.dart';
import 'custom_location_dialog.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final Set<String> selectedStatus = {};
  final Set<String> selectedService = {};
  final Set<String> selectedLocation = {};

  final List<String> statusOptions = ["عاجل", "مجدول", "قيد التنفيذ"];
  final List<String> serviceOptions = [ "إصلاح", "تنظيف","صيانة","إنشاء"];
  final List<String> locationOptions = [
    "القاهرة",
     "الجيزة",
        "مدينة نصر",
    "موقع مخصص",
 
   
    
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(25),
        horizontal: SizeConfig.w(15),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: SingleChildScrollView(
        child: Directionality(
           textDirection: TextDirection.rtl, // ✅ الاتجاه من اليمين لليسار
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FilterSection(
                title: "الحالة",
                options: statusOptions,
                selectedSet: selectedStatus,
              ),
              const SizedBox(height: 20),
              FilterSection(
                title: "نوع الخدمة",
                options: serviceOptions,
                selectedSet: selectedService,
              ),
              const SizedBox(height: 20),
              FilterSection(
                title: "الموقع",
                options: locationOptions,
                selectedSet: selectedLocation,
                onCustomLocationRequested: () async {
                  final customLocation =
                      await showCustomLocationDialog(context);
                  if (customLocation != null && customLocation.isNotEmpty) {
                    setState(() {
                      if (!locationOptions.contains(customLocation)) {
                        locationOptions.insert(1, customLocation);
                      }
                      selectedLocation.add(customLocation);
                    });
          
                   
                  }
                },
              ),
              SizedBox(height: SizeConfig.h(25)),
              Row(
                children: [
                   ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kprimarycolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.h(6),
                        horizontal: SizeConfig.w(10),
                      ),
                      child: Text(
                        "تصفية",
                        style: AppTextStyles.styleBold16(context)
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                    const Spacer(),
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: AppColors.kprimarycolor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.h(6),
                        horizontal: SizeConfig.w(10),
                      ),
                      child: Text("إلغاء",
                          style: AppTextStyles.styleBold16(context)),
                    ),
                  ),
                
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
