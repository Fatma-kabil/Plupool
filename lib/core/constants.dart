
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plupool/features/auth/data/models/role_item_model.dart';

final Color appColor = Color(0xFF12A0FF);

final String logo = 'assets/images/logo.svg';


const List<RoleItemModel> kRoleItems = [
  RoleItemModel(
    color: Color(0xFF3B82F6), // Light Blue
    imageUrl: 'assets/images/service_owner.png',
    title: 'الدخول كمالك  حمام',
    iconColor: Color(0xff2AAAFF),
  ),
  RoleItemModel(
    color: Color(0xffFF8D17), // Light Green
    imageUrl: 'assets/images/worker.png',
    title: 'الدخول كفني',
    iconColor:Color(0xffFFB76C),
  ),
  RoleItemModel(
    color: Color(0xFF9623FF), // Light Orange
    imageUrl: 'assets/images/admin.png',
    title: 'الدخول كمطور عقاري',
    iconColor: Color(0xffC07BFF),
  ),
];

