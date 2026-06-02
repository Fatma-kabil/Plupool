import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/profile/presentation/views/widgets/faq_section.dart';
import 'package:plupool/features/profile/presentation/views/widgets/faq_section_shimmer.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_cubit.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_state.dart';

class QuesSection extends StatefulWidget {
  const QuesSection({super.key, required this.role});

  final String role;

  @override
  State<QuesSection> createState() => _QuesSectionState();
}

class _QuesSectionState extends State<QuesSection> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FaqCubit>().getFaqs(role: widget.role);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqCubit, FaqState>(
      builder: (context, state) {
        if (state is FaqLoading) {
          return const FaqSectionShimmer();
        }

        if (state is FaqError) {
          return Center(child: ErrorText(message: state.message));
        }

        if (state is FaqSuccess) {
          final visibleFaqs = state.faqs
              .where((faq) => faq.isActive == true)
              .toList();

          if (visibleFaqs.isEmpty) {
            return const SizedBox.shrink();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الأسئلة الشائعة",
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              SizedBox(height: SizeConfig.h(15)),
              FaqSection(items: visibleFaqs),
              SizedBox(height: SizeConfig.h(35)),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
