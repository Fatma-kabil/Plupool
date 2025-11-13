import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/input_fields_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/notes_and_action_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/previous_value_section.dart';

class MaintenanceUpdateViewBody extends StatefulWidget {
  const MaintenanceUpdateViewBody({super.key});

  @override
  State<MaintenanceUpdateViewBody> createState() =>
      _MaintenanceUpdateViewBodyState();
}

class _MaintenanceUpdateViewBodyState extends State<MaintenanceUpdateViewBody> {
  final _formKey = GlobalKey<FormState>();

  final chlorineController = TextEditingController();
  final phController = TextEditingController();
  final tempController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void dispose() {
    chlorineController.dispose();
    phController.dispose();
    tempController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const PreviousValuesSection(),
            SizedBox(height: SizeConfig.h(20)),
            InputFieldsSection(
              chlorineController: chlorineController,
              phController: phController,
              tempController: tempController,
            ),
            SizedBox(height: SizeConfig.h(20)),
            NotesAndActionsSection(
              notesController: notesController,
              onSave: () {
                if (_formKey.currentState!.validate()) {
                  // ✅ valid — send data to backend or cubit
                  showCustomSnackBar(
                    context: context,
                    message: 'تم حفظ التغييرات بنجاح ✅',
                    isSuccess: true,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
