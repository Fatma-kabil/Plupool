import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/services/presentation/views/widgets/mood_button_row.dart';
import 'package:plupool/features/services/presentation/views/widgets/mood_switches.dart';

class MoodControlsDesign extends StatefulWidget {
  const MoodControlsDesign({super.key});

  @override
  State<MoodControlsDesign> createState() => _MoodControlsDesignState();
}

class _MoodControlsDesignState extends State<MoodControlsDesign> {
  int selectedIndex = 0;
  // 👈 أول كارد selected

   bool lightingOn = true; // 👈 حالة السويتش الأول
  bool musicOn = true;   // 👈 حالة السويتش الثاني

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.kprimarycolor, width: 1),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(1, 1)),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 22,
              top: 22,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Mood Controls",
                  style: AppTextStyles.styleBold16(
                    context,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      size: 20,
                      color: Colors.orange.shade300,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "قادمة قريبًا",
                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ],
                ),
                const SizedBox(height: 17),

                 // Mood Buttons
                MoodButtonsRow(
                  selectedIndex: selectedIndex,
                  onSelected: (i) => setState(() => selectedIndex = i),
                ),
                const SizedBox(height: 27),

                // Lighting
                
                // Switches
                MoodSwitches(
                  lightingOn: lightingOn,
                  musicOn: musicOn,
                  onLightingChanged: (val) => setState(() => lightingOn = val),
                  onMusicChanged: (val) => setState(() => musicOn = val),
                ),
              ],
            ),
          ),

          // Badge "قريباً"
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xff00B4D8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), // 👈 زاوية فوق شمال 10
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Text("قريباً", style: AppTextStyles.styleBold10(context)),
            ),
          ),
        ],
      ),
    );
  }
}
