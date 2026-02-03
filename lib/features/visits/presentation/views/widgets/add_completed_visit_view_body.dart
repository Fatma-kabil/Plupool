import 'package:flutter/material.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/visits/presentation/views/widgets/add_edit_completed_visit_form.dart';

class AddCompletedVisitViewBody extends StatefulWidget {
  const AddCompletedVisitViewBody({super.key});

  @override
  State<AddCompletedVisitViewBody> createState() => _AddCompletedVisitViewBodyState();
}

class _AddCompletedVisitViewBodyState extends State<AddCompletedVisitViewBody> {
   final _formKey = GlobalKey<FormState>();

  final visitsNumberController = TextEditingController();
  final chlorineController = TextEditingController();
  final notesController = TextEditingController();
  final phController = TextEditingController();
  final tempController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// المحتوى اللي بيعمل scroll
        AddEditCompletedVisitForm(

formKey:_formKey ,
visitsNumberController: visitsNumberController,
chlorineController: chlorineController,
notesController: notesController,
phController:phController ,
tempController:tempController ,

        ),
          

          
         
          SizedBox(height: 40),

          /// الزرار ثابت تحت
          AddEditOfferViewFooter(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: submit logic
              }
            },
            text: "إضافة",
          ),
        ],
      ),
    );
  }
}