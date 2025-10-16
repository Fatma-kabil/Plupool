import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

class AttachFileButton extends StatelessWidget {
  final VoidCallback onPickFile;

  const AttachFileButton({super.key, required this.onPickFile});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom:SizeConfig.h(2) ,
      left:SizeConfig.w(2) ,
      child: IconButton(
        onPressed: onPickFile,
        icon: Icon(
          Icons.attach_file,
          color: const Color(0xffBBBBBB),
          size: SizeConfig.w(20),
        ),
      ),
    );
  }
}
