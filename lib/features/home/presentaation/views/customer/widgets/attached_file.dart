import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class AttachedFile extends StatelessWidget {
  final String fileName;
  final VoidCallback onRemove;

  const AttachedFile({
    super.key,
    required this.fileName,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom:SizeConfig.h(4) ,
      right:SizeConfig.w(8) ,
      left:SizeConfig.w(40) ,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(6), vertical: SizeConfig.h(4)),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
             Icon(Icons.insert_drive_file, size: SizeConfig.w(16), color: Colors.grey),
             SizedBox(width: SizeConfig.w(6)),
            Expanded(
              child: Text(
                fileName,
                style: AppTextStyles.styleRegular13(context)
                    .copyWith(color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: onRemove,
              child:  Icon(Icons.close, size: SizeConfig.w(18), color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
