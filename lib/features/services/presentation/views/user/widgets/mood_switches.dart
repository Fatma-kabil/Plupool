import 'package:flutter/material.dart';
import 'control_switch_tile.dart';

class MoodSwitches extends StatelessWidget {
  final bool lightingOn;
  final bool musicOn;
  final ValueChanged<bool> onLightingChanged;
  final ValueChanged<bool> onMusicChanged;

  const MoodSwitches({
    super.key,
    required this.lightingOn,
    required this.musicOn,
    required this.onLightingChanged,
    required this.onMusicChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ControlSwitchTile(
          image: 'assets/icons/lighting.svg',
          title: "Lighting",
          value: lightingOn,
          onChanged: onLightingChanged,
        ),
        ControlSwitchTile(
          image: 'assets/icons/music.svg',
          title: "Music",
          value: musicOn,
          onChanged: onMusicChanged,
        ),
      ],
    );
  }
}
