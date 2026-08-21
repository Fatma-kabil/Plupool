import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';
import 'package:plupool/features/visits/domain/entities/reading_request_entity.dart';
import 'package:plupool/features/visits/presentation/manager/visits-cubit/booking_visits_cubit.dart';
import 'package:plupool/features/visits/presentation/manager/visits-cubit/booking_visits_state.dart';
import 'package:plupool/features/visits/presentation/views/widgets/add_edit_completed_visit_form.dart';

class EditCompletedVisitViewBody extends StatefulWidget {
  const EditCompletedVisitViewBody({
    super.key,
    required this.sourceBookingId,
    required this.visit,
    required this.reading,
  });

  final int sourceBookingId;
  final PackageVisitEntity visit;
  final ReadingEntity? reading;

  @override
  State<EditCompletedVisitViewBody> createState() =>
      _EditCompletedVisitViewBodyState();
}

class _EditCompletedVisitViewBodyState
    extends State<EditCompletedVisitViewBody> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController visitsNumberController;
  late final TextEditingController chlorineController;
  late final TextEditingController notesController;
  late final TextEditingController phController;
  late final TextEditingController tempController;

  @override
  void initState() {
    super.initState();

    visitsNumberController = TextEditingController(
      text: widget.visit.visitNumber.toString(),
    );

    chlorineController = TextEditingController(
      text: widget.reading?.chlorinePpm?.toString() ?? '',
    );

    phController = TextEditingController(
      text: widget.reading?.phLevel?.toString() ?? '',
    );

    tempController = TextEditingController(
      text: widget.reading?.temperatureC?.toString() ?? '',
    );

    notesController = TextEditingController(
      text: widget.reading?.notes ?? '',
    );
  }

  @override
  void dispose() {
    visitsNumberController.dispose();
    chlorineController.dispose();
    notesController.dispose();
    phController.dispose();
    tempController.dispose();

    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final reading = ReadingRequestEntity(
      visitNumber: int.tryParse(
        visitsNumberController.text.trim(),
      ),
      status: 'completed',
      chlorinePpm: double.tryParse(
        chlorineController.text.trim(),
      ),
      phLevel: double.tryParse(
        phController.text.trim(),
      ),
      temperatureC: double.tryParse(
        tempController.text.trim(),
      ),
      notes: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),
    );

    await context.read<BookingVisitsCubit>().updateLatestReading(
          sourceBookingId:182,
         //  widget.sourceBookingId,
          selectedVisitBookingId: widget.visit.bookingId,
          reading: reading,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingVisitsCubit, BookingVisitsState>(
      listener: (context, state) {
        if (state is UpdateLatestReadingSuccess) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: true,
          );

          Navigator.pop(context, true);
        }

        if (state is UpdateLatestReadingError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddEditCompletedVisitForm(
              formKey: _formKey,
              visitsNumberController: visitsNumberController,
              chlorineController: chlorineController,
              notesController: notesController,
              phController: phController,
              tempController: tempController,
            ),

            const SizedBox(height: 40),

            BlocBuilder<BookingVisitsCubit, BookingVisitsState>(
              builder: (context, state) {
                final isLoading =
                    state is UpdateLatestReadingLoading;

                return AddEditOfferViewFooter(
                  onPressed: isLoading ? null : _submit,
                  text: isLoading
                      ? "جاري التعديل..."
                      : "تعديل",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}