import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/profile/data/models/update_user_model.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:plupool/features/profile/presentation/views/widgets/edit_btn.dart';
import 'package:plupool/features/profile/presentation/views/widgets/profile_avatar_picker.dart';
import 'package:plupool/features/profile/presentation/views/widgets/update_company_info.dart';
import 'package:plupool/features/profile/presentation/views/widgets/update_owner_info.dart';
import 'package:plupool/features/profile/presentation/views/widgets/update_tech_info.dart';

class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({super.key});

  @override
  State<ProfileEditViewBody> createState() => _ProfileEditViewBodyState();
}

class _ProfileEditViewBodyState extends State<ProfileEditViewBody> {
  File? _pickedImage;

  final GlobalKey<UpdateTechInfoState> _techKey =
      GlobalKey<UpdateTechInfoState>();
  final GlobalKey<UpdateOwnerInfoState> _ownerKey =
      GlobalKey<UpdateOwnerInfoState>();
  final GlobalKey<UpdateCompanyInfoState> _companyKey =
      GlobalKey<UpdateCompanyInfoState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UpdateUserSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم تحديث البيانات بنجاح",
            isSuccess: true,
          );
          // يمكنك هنا إعادة تحميل بيانات المستخدم لو تحب
          context.read<UserCubit>().fetchCurrentUser(
            context.read<AuthCubit>().state.token!,
          );
        } else if (state is UpdateUserError) {
          showCustomSnackBar(
            context: context,
            message: 'خطأ: ${state.message}',
          );
        } else {
          Center(child: CustomLoadingIndecator());
        }
      },
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CustomLoadingIndecator());
          }

          if (state is UserError) {
            return Center(child: Text(state.message));
          }

          if (state is UserLoaded) {
            final user = state.user;

            return SizedBox.expand(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.h(15)),

                        /// الصورة
                        ProfileAvatarPicker(
                          networkImageUrl: user.profileImage,
                          onImagePicked: (image) {
                            _pickedImage = image;
                          },
                        ),

                        SizedBox(height: SizeConfig.h(30)),

                        /// الفورم حسب الدور مع key لكل ويدجت
                        if (user.role == 'technician')
                          UpdateTechInfo(key: _techKey, user: user)
                        else if (user.role == 'pool_owner')
                          UpdateOwnerInfo(key: _ownerKey, user: user)
                        else if (user.role == 'company')
                          UpdateCompanyInfo(key: _companyKey, user: user),

                        SizedBox(height: SizeConfig.h(30)),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: SizeConfig.h(10),
                    child: EditButton(
                      tittle: 'حفظ المعلومات',
                      onPressed: () async {
                        UpdateUserModel updateData;

                        if (user.role == 'technician') {
                          updateData = _techKey.currentState!
                              .getUpdateUserModel();
                        } else if (user.role == 'pool_owner') {
                          updateData = _ownerKey.currentState!
                              .getUpdateUserModel();
                        } else {
                          updateData = _companyKey.currentState!
                              .getUpdateUserModel();
                        }

                        if (_pickedImage != null) {
                          updateData = updateData.copyWith(
                            profileImage: _pickedImage!.path,
                          );
                        }

                        await context.read<UserCubit>().updateUser(
                          user.id,
                          context.read<AuthCubit>().state.token!,
                          updateData,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
