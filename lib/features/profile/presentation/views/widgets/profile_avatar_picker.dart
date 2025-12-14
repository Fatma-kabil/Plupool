import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProfileAvatarPicker extends StatefulWidget {
  final File? initialImage;
  final String? networkImageUrl;
  final void Function(File? image) onImagePicked;

  const ProfileAvatarPicker({
    super.key,
    this.initialImage,
    this.networkImageUrl,
    required this.onImagePicked,
  });

  @override
  State<ProfileAvatarPicker> createState() => _ProfileAvatarPickerState();
}

class _ProfileAvatarPickerState extends State<ProfileAvatarPicker> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(
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

  ImageProvider? _getImageProvider() {
    if (_pickedImage != null) {
      return FileImage(_pickedImage!);
    }

    if (widget.initialImage != null) {
      return FileImage(widget.initialImage!);
    }

    if (widget.networkImageUrl != null &&
        widget.networkImageUrl!.isNotEmpty &&
        widget.networkImageUrl != 'string') {
      return CachedNetworkImageProvider(widget.networkImageUrl!);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = _getImageProvider();

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(4)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.kprimarycolor,
                width: SizeConfig.w(3),
              ),
            ),
            child: CircleAvatar(
              radius: SizeConfig.isWideScreen
                  ? SizeConfig.w(40)
                  : SizeConfig.w(50),
              backgroundColor: Colors.grey[50],
              backgroundImage: imageProvider,
              child: imageProvider == null
                  ? Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: SizeConfig.w(65),
                    )
                  : null,
            ),
          ),
        ),

        /// أيقونة التعديل
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(4)),
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
