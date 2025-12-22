import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/home/domain/entities/contact_request_entity.dart';
import 'package:plupool/features/home/domain/repos/contact_repo.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactRepository contactRepository;

  ContactCubit(this.contactRepository) : super(ContactInitial());

  Future<void> sendContactMessage(ContactRequestEntity request) async {
    emit(ContactLoading());

    final failureOrMessage = await contactRepository.sendContactMessage(request);

    failureOrMessage.fold(
      (failure) => emit(ContactError(failure.message)),
      (message) => emit(ContactSuccess(message)),
    );
  }
}
