import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';

import 'package:plupool/features/offers/presentation/views/widgets/add_edit_offer_view_footer.dart';
import 'package:plupool/features/visits/domain/entities/reading_request_entity.dart';
import 'package:plupool/features/visits/presentation/manager/visits-cubit/booking_visits_cubit.dart';
import 'package:plupool/features/visits/presentation/views/widgets/add_edit_completed_visit_form.dart';

import 'package:plupool/features/visits/presentation/manager/visits-cubit/booking_visits_state.dart';

class AddCompletedVisitViewBody extends StatefulWidget {
  const AddCompletedVisitViewBody({
    super.key,
    required this.sourceBookingId,
    required this.currentVisitBookingId,
  });

  final int sourceBookingId;
  final int currentVisitBookingId;

  @override
  State<AddCompletedVisitViewBody> createState() =>
      _AddCompletedVisitViewBodyState();
}

class _AddCompletedVisitViewBodyState extends State<AddCompletedVisitViewBody> {
  final _formKey = GlobalKey<FormState>();

  final visitsNumberController = TextEditingController();
  final chlorineController = TextEditingController();
  final notesController = TextEditingController();
  final phController = TextEditingController();
  final tempController = TextEditingController();

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
      visitNumber: int.tryParse(visitsNumberController.text.trim()),
      status: 'completed',
      chlorinePpm: double.tryParse(chlorineController.text.trim()),
      phLevel: double.tryParse(phController.text.trim()),
      temperatureC: double.tryParse(tempController.text.trim()),
      notes: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),
    );

    await context.read<BookingVisitsCubit>().addReading(
      sourceBookingId: 
       widget.sourceBookingId,
      currentVisitBookingId: 
       widget.currentVisitBookingId,
      reading: reading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingVisitsCubit, BookingVisitsState>(
      listener: (context, state) {
        if (state is AddReadingSuccess) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: true,
          );

          Navigator.pop(context, true);
        }

        if (state is AddReadingError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            // isSuccess: true
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
                final isLoading = state is AddReadingLoading;

                return AddEditOfferViewFooter(
                  onPressed: isLoading ? null : _submit,
                  text: isLoading ? "جاري الإضافة..." : "إضافة",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
