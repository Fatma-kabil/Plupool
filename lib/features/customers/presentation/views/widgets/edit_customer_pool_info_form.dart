import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class EditCustomerPoolInfoForm extends StatefulWidget {
  const EditCustomerPoolInfoForm({
    super.key,
    required this.formKey,
    required this.poolWidthController,
    required this.poolHeightController,
    required this.poolLengthController,
    required this.poolVolumeController,
    required this.selectedPackage,
    required this.onPoolChanged,
  });
  final GlobalKey<FormState> formKey;

  final TextEditingController poolWidthController;
  final TextEditingController poolHeightController;
  final TextEditingController poolLengthController;
  final TextEditingController poolVolumeController;
  final ValueChanged<String?> onPoolChanged;

  final String selectedPackage;
  @override
  State<EditCustomerPoolInfoForm> createState() =>
      _EditCustomerPoolInfoFormState();
}

class _EditCustomerPoolInfoFormState extends State<EditCustomerPoolInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// نوع الباقة + عدد الزيارات
              const FieldLabel('نوع حمام السباحه'),
              StatusSelector<String>(
                
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.h(12),
                  horizontal: SizeConfig.w(12),
                ),
                icon: Icons.pool_rounded,
                selected: widget.selectedPackage,
                items: const [
                  "أوفر فلو",
                  "اسكيمير",
                  "أولمبي",
                  "خارجي بفلتر حمام",
                  "تدريب",
                ],
                displayText: (value) => value,
                onChanged: widget.onPoolChanged,
              ),
              const SizedBox(height: 22),
              const FieldLabel("عرض حمام السباحة (بالمتر)"),
              TextFieldWithIcon(
                hint: "عرض حمام السباحة",
                icon: Icons.swap_vert_rounded,
                keyboardType: TextInputType.number,
                controller: widget.poolWidthController,
              ),
        
              const SizedBox(height: 22),
              const FieldLabel("ارتفاع حمام السباحة (بالمتر)"),
              TextFieldWithIcon(
                hint: "ارتفاع حمام السباحة",
                icon: Icons.height,
                keyboardType: TextInputType.number,
                controller: widget.poolHeightController,
              ),
        
              const SizedBox(height: 22),
              const FieldLabel("طول حمام السباحة (بالمتر)"),
              TextFieldWithIcon(
                hint: "طول حمام السباحة",
                icon: Icons.straighten,
                keyboardType: TextInputType.number,
                controller: widget.poolLengthController,
              ),
        
              const SizedBox(height: 22),
              const FieldLabel("حجم حمام السباحة (بالتر)"),
              TextFieldWithIcon(
                hint: "حجم حمام السباحة ",
                icon: Icons.view_in_ar,
                keyboardType: TextInputType.number,
                controller: widget.poolVolumeController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
