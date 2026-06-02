import 'package:flutter/material.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/done_contact_us_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/ques_section.dart';
import 'package:plupool/features/profile/presentation/views/widgets/support_contact_card.dart';

class HelpViewBody extends StatelessWidget {
  HelpViewBody({super.key, required this.role});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final notesController = TextEditingController();
  final String role;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuesSection(role: role),

          SupportContactCard(
            notesController: notesController,
            formKey: _formKey,
            onSend: () {
              if (_formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                    backgroundColor: Colors.white,
                    insetPadding: EdgeInsets.all(
                      20,
                    ), // يتحكم في المسافة حوالين الدايلوج
                    child: DoneContactUsCard(), // 👈 بيرجع الويدجت اللي فوق
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
