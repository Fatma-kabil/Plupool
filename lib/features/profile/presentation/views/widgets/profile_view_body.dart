
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/profile/presentation/views/widgets/company_profile_body.dart';
import 'package:plupool/features/profile/presentation/views/widgets/owner_profile_body.dart';
import 'package:plupool/features/profile/presentation/views/widgets/tech_profile_body.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
               //    OwnerProfileBody();
          
           TechProfileBody();
       //   CompanyProfileBody();

           
          
  }
}
