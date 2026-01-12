import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class AttachmentChip extends StatelessWidget {
  final String fileName;
  final VoidCallback? onTap;

  const AttachmentChip({
    super.key,
    required this.fileName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: EdgeInsets.only(left:SizeConfig.w(12) ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(6),
        ),
        decoration: BoxDecoration(
          color: const Color(0xffD4D4D4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             Icon(
              Icons.attach_file,
              size: SizeConfig.w(16),
              color: const Color(0xff777777),
            ),
             SizedBox(width: SizeConfig.w(4)),
            Text(
              fileName,
              style: AppTextStyles.styleRegular16(context)
                  .copyWith(color: const Color(0xff333333)),
            ),
           
           
          ],
        ),
      ),
    );
  }
}
