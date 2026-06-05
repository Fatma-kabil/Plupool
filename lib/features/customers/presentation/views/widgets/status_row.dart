import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/container_status.dart';

class StatusRow extends StatelessWidget {
  const StatusRow({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  final bool isActive;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContainerStatus(isActive: isActive),
        const Spacer(),
        Transform.scale(
          scale: SizeConfig.w(
            SizeConfig.isWideScreen ? 0.4 : 0.6,
          ),
          child: Switch(
            value: isActive,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: AppColors.kprimarycolor,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.black12,
          ),
        ),
      ],
    );
  }
}