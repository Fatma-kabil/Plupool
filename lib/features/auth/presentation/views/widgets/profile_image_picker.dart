import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({super.key});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: SizeConfig.h(20)),
        decoration: BoxDecoration(
          color: const Color(0xffE0E0E0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: _profileImage == null
              ? Column(
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: SizeConfig.h(35),
                      color: const Color(0xff777777),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "أضف صورة (اختياري)",
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ],
                )
              : CircleAvatar(
                  radius: SizeConfig.h(45),
                  backgroundImage: FileImage(_profileImage!),
                ),
        ),
      ),
    );
  }
}
