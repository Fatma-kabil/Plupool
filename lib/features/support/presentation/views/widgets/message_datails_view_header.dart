import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/location_row.dart';
import 'package:plupool/features/customers/presentation/views/widgets/container_status.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/info_col.dart';

class MessageDatailsViewHeader extends StatelessWidget {
  const MessageDatailsViewHeader({
    super.key,
    this.imageUrl,
    required this.name,
    required this.status,
    this.location, required  this.phone,
  });
  final String? imageUrl;
  final String name;
  final bool status;
  final String? location;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(16),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               CustomerAvatar(
                imageUrl: imageUrl,
               ),
              SizedBox(width: SizeConfig.w(7)),
               CustomerInfo(
                name: name,
                phone: phone,
              ),
              const Spacer(),
              ContainerStatus(isActive: status),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),
           if (location != null && location!.isNotEmpty) ...[
            InfoCol(
              label: "العنوان:",
              value: location!,
            ),

            SizedBox(height: SizeConfig.h(8)),

            LocationRow(location: location!),
          ],
        ],
      ),
    );
  }
}
