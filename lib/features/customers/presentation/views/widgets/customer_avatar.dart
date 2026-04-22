import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerAvatar extends StatelessWidget {
  const CustomerAvatar({
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: SizeConfig.w(17),
      backgroundColor: Colors.grey.shade200,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? "",
          width: SizeConfig.w(38),
          height: SizeConfig.w(38),
          fit: BoxFit.cover,
        
          /// 🔄 Loading state
          placeholder: (context, url) => Container(
            width: SizeConfig.w(38),
            height: SizeConfig.w(38),
            color: Colors.grey.shade300,
          ),

          /// ❌ Error state
          errorWidget: (context, url, error) => Container(
            width: SizeConfig.w(38),
            height: SizeConfig.w(38),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: SizeConfig.w(18),
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}