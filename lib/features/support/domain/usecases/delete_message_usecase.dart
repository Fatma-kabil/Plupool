import 'package:plupool/features/support/domain/repos/contact_repo.dart';



class DeleteMessageUseCase {
  final ContactRepository repo;

  DeleteMessageUseCase(this.repo);

  Future<void> call(int id) {
    return repo.deleteMessage(id);
  }
}