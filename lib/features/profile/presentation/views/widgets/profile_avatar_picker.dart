import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProfileAvatarPicker extends StatefulWidget {
  final File? initialImage;
  final void Function(File? image) onImagePicked;

  const ProfileAvatarPicker({
    super.key,
    this.initialImage,
    required this.onImagePicked,
  });

  @override
  State<ProfileAvatarPicker> createState() => _ProfileAvatarPickerState();
}

class _ProfileAvatarPickerState extends State<ProfileAvatarPicker> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (file != null) {
      setState(() {
        _pickedImage = File(file.path);
      });
      widget.onImagePicked(_pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = _pickedImage ?? widget.initialImage;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(4)), // السمك الخارجي
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.kprimarycolor,
                width: SizeConfig.w(3),
              ),
            ),
            child: CircleAvatar(
              radius: SizeConfig.w(55),
              backgroundImage: image != null
                  ? FileImage(image)
                  : const AssetImage("assets/images/ahmed.png")
                      as ImageProvider,
            ),
          ),
        ),

        // أيقونة التعديل
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                ),
              ],
            ),
            padding: EdgeInsets.all(SizeConfig.w(6)),
            child: Icon(
              Icons.edit,
              color: AppColors.kprimarycolor,
              size: SizeConfig.w(20),
            ),
          ),
        ),
      ],
    );
  }
}
