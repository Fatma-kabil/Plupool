import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class TechnicianMultiSelectField extends StatefulWidget {
  const TechnicianMultiSelectField({
    super.key,
    required this.controller,
    required this.onSelected,
  });

  final TextEditingController controller;
  final Function(List<UserEntity>) onSelected;

  @override
  State<TechnicianMultiSelectField> createState() =>
      _TechnicianMultiSelectFieldState();
}

class _TechnicianMultiSelectFieldState
    extends State<TechnicianMultiSelectField> {
  bool isExpanded = false;
  String searchText = '';

  final List<UserEntity> selectedTechnicians = [];

  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().getUsers();
  }

  void updateController() {
    widget.controller.text = selectedTechnicians
        .map((e) => e.fullName)
        .join(' - ');
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (_) {
        setState(() {
          isExpanded = false;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// الفنيين المختارين
          if (selectedTechnicians.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: selectedTechnicians.map((tech) {
                return Chip(
                  backgroundColor: AppColors.kScaffoldColor,

                  label: Text(
                    tech.fullName,
                    style: AppTextStyles.styleMedium13(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),

              //    labelPadding: EdgeInsets.zero,

                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(2),
                    vertical:  SizeConfig.h(4),
                  ),

                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),

                  deleteIcon: Icon(
                    Icons.close,
                    size: SizeConfig.w(15),
                    color: AppColors.ktextcolor,
                  ),

                  onDeleted: () {
                    setState(() {
                      selectedTechnicians.remove(tech);
                      updateController();
                    });

                    widget.onSelected(selectedTechnicians);
                  },
                );
              }).toList(),
            ),

          const SizedBox(height: 8),

          /// البحث
          TextFieldWithIcon(
            hint: "اختر الفنيين",
            icon: Icons.engineering,
            controller: widget.controller,
            tailing: true,
            onTap: () {
              setState(() {
                isExpanded = true;
              });
            },
            onChanged: (value) {
              setState(() {
                searchText = value;
                isExpanded = true;
              });
            },
          ),

          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                if (state is UsersLoading) {
                  return const Center(

                    child: CircularProgressIndicator(),
                  );
                }

                if (state is UsersError) {
                  return ErrorText(message:  state.message);
                }

                final users = state is UsersSuccess ? state.users : [];

                final technicians = users
                    .where((e) => e.role == "technician")
                    .where(
                      (e) => e.fullName.toLowerCase().contains(
                        searchText.toLowerCase(),
                      ),
                    )
                    .toList();

                if (technicians.isEmpty) {
                  return const Center(
                    child: ErrorText(message: "لا يوجد فنيين"),
                  );
                }

                return Container(
                  constraints: const BoxConstraints(maxHeight: 200),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: technicians.length,
                    itemBuilder: (context, index) {
                      final technician = technicians[index];

                      final isSelected = selectedTechnicians.any(
                        (e) => e.id == technician.id,
                      );

                      return ListTile(
                        dense: true,
                        trailing: isSelected
                            ? Icon(
                                size: SizeConfig.w(15),
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : null,
                        title: Text(
                          technician.fullName,
                          style: AppTextStyles.styleMedium13(
                            context,
                          ).copyWith(color: AppColors.ktextcolor),
                        ),
                        onTap: () {
                          setState(() {
                            if (!isSelected) {
                              selectedTechnicians.add(technician);
                            } else {
                              selectedTechnicians.removeWhere(
                                (e) => e.id == technician.id,
                              );
                            }

                            updateController();
                          });

                          widget.onSelected(selectedTechnicians);
                        },
                      );
                    },
                  ),
                );
              },
            ),
            secondChild: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
