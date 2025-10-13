
import 'package:flutter/material.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/filter_sheet.dart';

void showFullWidthBottomSheet(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "FilterSheet",
    barrierDismissible: true,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: IntrinsicHeight( // 👈 ده اللي بيخلي الارتفاع حسب المحتوى
            child: Container(
              width: MediaQuery.of(context).size.width, // العرض الكامل
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: const FilterSheet(),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: anim1,
          curve: Curves.easeOutCubic,
        )),
        child: child,
      );
    },
  );
}
