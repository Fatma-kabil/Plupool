import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/home/presentaation/manager/add_rating_cubit/add_rating_cubit.dart';
import 'package:plupool/features/home/presentaation/manager/add_rating_cubit/add_rating_state.dart';

class CommentInput extends StatelessWidget {
  const CommentInput({super.key, required this.imageUrl});

  final String imageUrl;

  bool _isValidImage(String image) {
    return image.isNotEmpty && image != 'string' && image.startsWith('http');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddRatingCubit, RatingState>(
      listener: (context, state) {
        if (state is RatingSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم إرسال التقييم بنجاح",
            isSuccess: true,
          );
        }

        if (state is RatingError) {
          showCustomSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AddRatingCubit>();

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "قيّم تجربتك معنا",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: const Color(0xff555555)),
                ),
                SizedBox(width: SizeConfig.w(24)),

                ...List.generate(
                  5,
                  (index) => GestureDetector(
                    onTap: () {
                      cubit.changeRating(index + 1);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.w(2),
                      ),
                      child: Icon(
                        index < cubit.selectedRating
                            ? Icons.star
                            : Icons.star_border,
                        color: const Color(0xffFF9F1C),
                        size: SizeConfig.w(22),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                CircleAvatar(
                  radius: SizeConfig.w(18),
                  backgroundColor: Colors.grey[200],
                  child: ClipOval(
                    child: _isValidImage(imageUrl)
                        ? CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            width: SizeConfig.w(34),
                            height: SizeConfig.w(34),
                            placeholder: (_, __) => Icon(
                              Icons.person,
                              size: SizeConfig.w(22),
                              color: Colors.grey,
                            ),
                            errorWidget: (_, __, ___) => Icon(
                              Icons.person,
                              size: SizeConfig.w(22),
                              color: AppColors.kprimarycolor,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: SizeConfig.w(22),
                            color: Colors.grey,
                          ),
                  ),
                ),

                SizedBox(width: SizeConfig.w(12)),

                Expanded(
                  child: TextField(
                    controller: cubit.commentController,
                    cursorColor: AppColors.kprimarycolor,
                    style: AppTextStyles.styleSemiBold14(
                      context,
                    ).copyWith(color: Colors.black),
                    cursorHeight: SizeConfig.w(15),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "اكتب تعليقك هنا...",
                      hintStyle: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: const Color(0xffBBBBBB)),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.w(12),
                        vertical: SizeConfig.h(12),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xffD6D6D6)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xffD6D6D6)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xffD6D6D6),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: SizeConfig.w(12)),

                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: state is RatingLoading
                      ? null
                      : () {
                          cubit.addRating();
                        },
                  child: Container(
                    width: SizeConfig.w(32),
                    height: SizeConfig.w(32),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff0077B6),
                    ),
                    child: Center(
                      child: state is RatingLoading
                          ? SizedBox(
                              width: SizeConfig.w(16),
                              height: SizeConfig.w(16),
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.white,
                              size: SizeConfig.w(18),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
