import 'dart:io';

import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/pick_date_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/date_picker_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/profile_image_picker.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/custom_check_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/description_input.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class AddOfferViewBody extends StatefulWidget {
  const AddOfferViewBody({super.key});

  @override
  State<AddOfferViewBody> createState() => _AddOfferViewBodyState();
}

class _AddOfferViewBodyState extends State<AddOfferViewBody> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final offerController = TextEditingController();
  final desController = TextEditingController();
  File? _profileImage;
  DateTime? startDate;
  DateTime? endDate;
  String? startDateError;
  String? endDateError;
  bool acceptedTerms = false;

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FieldLabel('عنوان العرض'),
              TextField(
                controller: titleController,
                hint: 'أكتب عنوان العرض....',
              ),
        
              const SizedBox(height: 15),
        
              const FieldLabel('قيمة الخصم'),
              TextField(controller: offerController, hint: 'أكتب قيمة الخصم....'),
        
              const SizedBox(height: 15),
        
              DatePickerField(
                dirc: CrossAxisAlignment.start,
                text: "تاريخ بدء العرض",
                selectedDateColor: AppColors.ktextcolor,
                selectedDate: startDate,
                dateFormat: formatDate,
                errorText: startDateError,
                onTap: () async {
                  final picked = await pickDateFun(context);
                  if (picked != null) {
                    setState(() {
                      startDate = picked;
                      startDateError = null;
                    });
                  }
                },
              ),
              const SizedBox(height: 15),
        
              DatePickerField(
                dirc: CrossAxisAlignment.start,
                text: "تاريخ نهاية العرض",
                selectedDateColor: AppColors.ktextcolor,
                selectedDate: endDate,
                dateFormat: formatDate,
                errorText: endDateError,
                onTap: () async {
                  final picked = await pickDateFun(context);
                  if (picked != null) {
                    setState(() {
                      endDate = picked;
                      endDateError = null;
                    });
                  }
                },
              ),
              const SizedBox(height: 15),
              const FieldLabel('وصف العرض'),
             DescriptionInputContainer(controller: desController),

              const SizedBox(height: 20),
              const FieldLabel('صور العرض'),
              ProfileImagePicker(
                backgroundColor: Color(0xffCDCDCD),
                title: "أضف صورة للعرض",
                isCircle: false,
                icon: Icons.add_photo_alternate_outlined,
                onImagePicked: (img) => _profileImage = img,
              ),
              const SizedBox(height: 15),
              CustomCheckbtn(
                value: acceptedTerms,
                onChanged: (val) => setState(() => acceptedTerms = val),
                label: "عرض مميز (يظهر في الصفحة الرئيسية)",
              ),
        
              const SizedBox(height: 40),
        
              AddEditOfferViewFooter(onPressed: () {}, text: "إضافة"),
               const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
