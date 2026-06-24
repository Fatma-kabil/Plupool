import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/products/presentation/views/widgets/textfield_with_icon.dart';

class CustomerSearchField extends StatefulWidget {
  const CustomerSearchField({
    super.key,
    required this.controller,
    required this.onSelected,
  });

  final TextEditingController controller;
  final Function(UserEntity user) onSelected;

  @override
  State<CustomerSearchField> createState() => _CustomerSearchFieldState();
}

class _CustomerSearchFieldState extends State<CustomerSearchField> {
  bool isExpanded = false;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return
     Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ===== SEARCH FIELD =====
        TextFieldWithIcon(
          hint: "اختار العميل",
          icon: Icons.person,
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

        /// ===== RESULTS =====
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              if (state is UsersLoading) {
                return const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(),
                );
              }

              if (state is UsersError) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(state.message),
                );
              }

              final users = state is UsersSuccess ? state.users : [];

              final customers = users
                  .where((e) => e.role == "pool_owner")
                  .where(
                    (e) => e.fullName
                        .toLowerCase()
                        .contains(searchText.toLowerCase()),
                  )
                  .toList();

              if (customers.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("لا توجد نتائج"),
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
                  itemCount: customers.length,
                  itemBuilder: (context, index) {
                    final user = customers[index];

                    return ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -4),
                      title: Text(
                        user.fullName,
                        style: AppTextStyles.styleMedium13(context).copyWith(
                          color: AppColors.ktextcolor,
                        ),
                      ),
                      onTap: () {
                        widget.controller.text = user.fullName;

                        setState(() {
                          searchText = user.fullName;
                          isExpanded = false;
                        });

                        widget.onSelected(user);
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
    );
  }
}