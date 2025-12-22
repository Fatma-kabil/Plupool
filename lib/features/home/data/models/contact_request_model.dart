

import 'package:plupool/features/home/domain/entities/contact_request_entity.dart';

class ContactRequestModel extends ContactRequestEntity {
  ContactRequestModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "message": message,
    };
  }
}
