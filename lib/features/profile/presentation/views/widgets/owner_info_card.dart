import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/build_info_row.dart';

class OwnerInfoCard extends StatelessWidget {
  const OwnerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            value: 'أحمد محمد',
          ),
          SizedBox(height: 15),
          BuildInfoRow(
            icon: Icons.location_on_outlined,
            title: 'مكان الإقامة',
            value: 'القاهرة',
          ),
         
        
          BuildInfoRow(
            icon: Icons.phone_outlined,
            title: 'رقم الهاتف',
            value: '01555222999',
          ),
        ],
      ),
    );
  }
}
