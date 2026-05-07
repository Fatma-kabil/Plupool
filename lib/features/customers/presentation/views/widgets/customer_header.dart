import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_status.dart';

class CustomerHeader extends StatelessWidget {
  const CustomerHeader({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CustomerAvatar(imageUrl: user.profileImage,),
        SizedBox(width: SizeConfig.w(7)),
         CustomerInfo(name: user.fullName,phone: user.phone,),
        const Spacer(),
        CustomerStatus(isActive: user.isActive),
      ],
    );
  }
}
