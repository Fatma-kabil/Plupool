import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/container_status.dart';

class StatusRow extends StatefulWidget {
  const StatusRow({super.key});

  @override
  State<StatusRow> createState() => _StatusRowState();
}

class _StatusRowState extends State<StatusRow> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        ContainerStatus(isActive: isActive,),
        Spacer(),
         Transform.scale(
          scale:SizeConfig.w(SizeConfig.isWideScreen ? 0.4 : 0.6), // جرب 0.7 أو 0.6 كمان لو عايز أصغر
          child: Switch(
            value: isActive,
            onChanged: (value) {
              setState(() {
                isActive = value;
              });
            },
            activeColor: Colors.white, // لون الدائرة لما On
            activeTrackColor: AppColors.kprimarycolor, // لون الخلفية لما On
            inactiveThumbColor: Colors.grey,     // لون الدائرة لما Off
    inactiveTrackColor: Colors.black12,  // لون الخلفية لما Off // لون الخلفية لما Off),
          ),
        ),
        // Add your status widgets here
      ],
    );
  }
}