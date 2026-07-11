import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class AttachmentChip extends StatelessWidget {
  final String fileName;
  final String? fileUrl;
  final VoidCallback? onTap;

  const AttachmentChip({
    super.key,
    required this.fileName,
    this.fileUrl,
    this.onTap,
  });

  Future<void> _openFile() async {
    if (fileUrl == null) return;

    final uri = Uri.parse(fileUrl!);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? _openFile,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: EdgeInsets.only(left: SizeConfig.w(12)),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(2),
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
            Expanded(
              child: Text(
                fileName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: const Color(0xff333333)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
