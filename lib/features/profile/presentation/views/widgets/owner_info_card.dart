import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/build_info_row.dart';

import 'package:plupool/features/profile/domain/entities/user_entity.dart';

class OwnerInfoCard extends StatelessWidget {
  const OwnerInfoCard({super.key, required this.model});
 final UserEntity model;
  @override
  Widget build(BuildContext context) {
     final phone = model.phone
        .replaceFirst("+20", "")
        .trim();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: SizeConfig.h(20),bottom:SizeConfig.h(20),right: SizeConfig.w(8) ),
      decoration: BoxDecoration(
       color:  Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BuildInfoRow(
            icon: Icons.person_outline,
            title: 'الاسم',
            value: model.fullName,
          ),
          SizedBox(height:SizeConfig.h(15) ),
          BuildInfoRow(
            icon: Icons.location_on_outlined,
            title: 'مكان الإقامة',
            value: model.address,
          ),
         
         SizedBox(height:SizeConfig.h(15) ),
          BuildInfoRow(
            icon: Icons.phone_outlined,
            title: 'رقم الهاتف',
            value: phone,
          ),
        ],
      ),
    );
  }
}
