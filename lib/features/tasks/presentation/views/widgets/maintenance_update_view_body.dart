import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/tasks/domain/entities/water_quality_entity.dart';
import 'package:plupool/features/tasks/domain/entities/water_quality_history_entity.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_cubit.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/input_fields_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/notes_and_action_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/previous_value_section.dart';

class MaintenanceUpdateViewBody extends StatefulWidget {
  const MaintenanceUpdateViewBody({
    super.key,
    required this.data,
    required this.taskId,
  });

  final WaterQualityEntity data;
  final int taskId;

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
    return BlocConsumer<TechnicianTasksCubit, TechnicianTasksState>(
      listener: (context, state) {
        if (state is CompleteTaskWithReadingSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم إنهاء المهمة بنجاح ✅",
            isSuccess: true,
          );

          Navigator.pop(context, true);
        }

        if (state is CompleteTaskWithReadingFailure) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: false,
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                PreviousValuesSection(data: widget.data),

                SizedBox(height: SizeConfig.h(20)),

                InputFieldsSection(
                  chlorineController: chlorineController,
                  phController: phController,
                  tempController: tempController,
                ),

                SizedBox(height: SizeConfig.h(20)),

                NotesAndActionsSection(
                  notesController: notesController,
                  isLoading: state is CompleteTaskWithReadingLoading,
                  onSave: () {
                    if (!_formKey.currentState!.validate()) return;

                    context
                        .read<TechnicianTasksCubit>()
                        .completeTaskWithReading(
                          taskId: widget.taskId,
                          request: WaterQualityHistoryEntity(
                            temperature: tempController.text.trim().isEmpty
                                ? 0
                                : double.parse(
                                    normalizeArabicNumbers(
                                      tempController.text.trim(),
                                    ),
                                  ),

                            chlorine: double.parse(
                              normalizeArabicNumbers(
                                chlorineController.text.trim(),
                              ),
                            ),

                            ph: double.parse(
                              normalizeArabicNumbers(phController.text.trim()),
                            ),

                            alkalinity: 0,
                            salinity: 0,

                            notes: notesController.text.trim().isEmpty
                                ? null
                                : notesController.text.trim(),

                            recordedAt: DateTime.now()
                                .toUtc()
                                .toIso8601String(),
                            relativeTime: null,
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
