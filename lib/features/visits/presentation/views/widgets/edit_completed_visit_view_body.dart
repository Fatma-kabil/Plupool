import 'package:flutter/material.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/visits/presentation/views/widgets/add_edit_completed_visit_form.dart';

class EditCompletedVisitViewBody extends StatefulWidget {
  const EditCompletedVisitViewBody({super.key});

  @override
  State<EditCompletedVisitViewBody> createState() =>
      _EditCompletedVisitViewBodyState();
}

class _EditCompletedVisitViewBodyState
    extends State<EditCompletedVisitViewBody> {
  final _formKey = GlobalKey<FormState>();

  final visitsNumberController = TextEditingController(text: "1");
  final chlorineController = TextEditingController(text: '4.1');
  final notesController = TextEditingController(text: 'جميع القراءات طبيعية. تم تنظيف سلال الكاشطة وغسل الفلتر.');
  final phController = TextEditingController(text: '7.4');
  final tempController = TextEditingController(text: '30');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// المحتوى اللي بيعمل scroll
          AddEditCompletedVisitForm(
            formKey: _formKey,
            visitsNumberController: visitsNumberController,
            chlorineController: chlorineController,
            notesController: notesController,
            phController: phController,
            tempController: tempController,
          ),

          SizedBox(height: 40),

          /// الزرار ثابت تحت
          AddEditOfferViewFooter(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: submit logic
              }
            },
            text: "تعديل",
          ),
        ],
      ),
    );
  }
}
