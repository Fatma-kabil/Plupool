
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            textDirection: TextDirection.rtl,
            title,
            style: AppTextStyles.styleSemiBold25(context),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 8),

        // ✅ النص الوصفي
        Center(
          child: Text(
            textDirection: TextDirection.rtl,
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleRegular16(context),
          ),
        ),
      ],
    );
  }
}
