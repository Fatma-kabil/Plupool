import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/done_contact_us_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/faq_section.dart';
import 'package:plupool/features/profile/presentation/views/widgets/support_contact_card.dart';
class HelpViewBody extends StatelessWidget {
  HelpViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الأسئلة الشائعة",
            style: AppTextStyles.styleBold16(context)
                .copyWith(color: AppColors.ktextcolor),
          ),

          SizedBox(height: SizeConfig.h(15)),
           FaqSection( 
            items:ownerQes
            // techQes
           ),
          SizedBox(height: SizeConfig.h(35)),

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
