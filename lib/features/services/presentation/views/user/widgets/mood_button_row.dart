import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'mood_button.dart';

class MoodButtonsRow extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const MoodButtonsRow({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(moods.length, (index) {
        final mood = moods[index];
        return Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(4) ),
            child: MoodButton(
              image: mood["image"]!,
              label: mood["label"]!,
              isSelected: selectedIndex == index,
              onTap: () => onSelected(index),
            ),
          ),
        );
      }),
    );
  }
}
