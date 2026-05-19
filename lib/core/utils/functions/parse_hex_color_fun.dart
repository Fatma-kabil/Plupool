
  import 'dart:ui';

import 'package:flutter/material.dart';

Color parseHexColor(String? hex) {
    try {
      if (hex == null || hex.isEmpty) return Colors.grey;
      return Color(int.parse('0xFF${hex.replaceAll('#', '')}'));
    } catch (e) {
      return Colors.grey;
    }
  }
