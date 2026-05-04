

import 'package:plupool/features/projects/data/models/our_project_moddel.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';

extension OurProjectMapper on OurProjectModel {
  OurProjectEntity toEntity(int total) {
    return OurProjectEntity(
      id: id,
      title: nameAr,
      description: descriptionAr,
      image: mainImage,
      total: total,
    );
  }
}