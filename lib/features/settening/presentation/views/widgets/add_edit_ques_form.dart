import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/features/offers/presentation/views/widgets/description_input.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class AddEditQuesForm extends StatelessWidget {
  const AddEditQuesForm({
    super.key,
    required this.formKey,
    required this.questionController,
    required this.answerController,
    required this.orderController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController questionController;
  final TextEditingController answerController;
  final TextEditingController orderController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// السؤال
          const FieldLabel('السؤال'),
          TextField(
            validator: (value) =>
                Validators.required(value, fieldName: 'السؤال'),
            controller: questionController,
            hint: 'اكتب السؤال هنا...',
          ),

          const SizedBox(height: 20),

          /// الإجابة
          const FieldLabel('الإجابة'),
          DescriptionInputContainer(
            validator: (value) =>
                Validators.required(value, fieldName: 'الإجابة'),
            controller: answerController,
            text: "اكتب الإجابة هنا...",
          ),

          const SizedBox(height: 20),

          /// ترتيب السؤال
          const FieldLabel("ترتيب السؤال"),
          TextFieldWithIcon(
            hint: "مثال: 1",
            icon: Icons.numbers_sharp,
            keyboardType: TextInputType.number,
            controller: orderController,
            validator: (value) =>
                Validators.required(value, fieldName: 'ترتيب السؤال'),
            
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
