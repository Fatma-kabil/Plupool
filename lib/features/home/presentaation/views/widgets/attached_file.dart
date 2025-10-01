import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

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
      bottom: 4,
      right: 8,
      left: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            const Icon(Icons.insert_drive_file, size: 18, color: Colors.grey),
            const SizedBox(width: 6),
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
              child: const Icon(Icons.close, size: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
