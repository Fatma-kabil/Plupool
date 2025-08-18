import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/data/models/role_item_model.dart';
import 'package:plupool/features/auth/presentation/views/widgets/icon_container.dart';

class SelectRoleItem extends StatelessWidget {
  const SelectRoleItem({super.key, required this.item});

  final RoleItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.isWideScreen ? 17 : 10.0,
          vertical: 13,
        ),
        child: Row(
          children: [
            IconContainer(
              iconColor: item.iconColor,
              onTap: () {
                context.push('/login');
              },
            ),

            Expanded(
              child: Text(
                textDirection: TextDirection.rtl,
                item.title,
                style: AppTextStyles.styleSemiBold16(context),
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              radius: SizeConfig.w(SizeConfig.isWideScreen ? 18 : 14),
              backgroundImage: AssetImage(
                item.imageUrl,
              ), // الصورة هنا هتكون دائرية
              backgroundColor:
                  Colors.transparent, // عشان ما يكونش فيه لون خلفية
            ),
          ],
        ),
      ),
    );
  }
}
