import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_card.dart';
import 'package:plupool/features/customers/presentation/views/widgets/user_shimmer_list.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';

class CustomerViewBody extends StatefulWidget {
  const CustomerViewBody({super.key});

  @override
  State<CustomerViewBody> createState() => _CustomerViewBodyState();
}

class _CustomerViewBodyState extends State<CustomerViewBody> {
  String selected = "نشط";
  String _search = "";

  bool get isSearching => _search.isNotEmpty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsersCubit>().getUsers(role: "pool_owner", isActive: true);
    });
  }
  

  void onSearchChanged(String value) {
    setState(() => _search = value);

    context.read<UsersCubit>().getUsers(
      role: "pool_owner",
      search: value.isEmpty ? "" : value,
    );
  }

  void onFilterChanged(String val) {
    setState(() => selected = val);

    context.read<UsersCubit>().getUsers(
      role: "pool_owner",
      isActive: val == "نشط",
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            /// 🔝 header
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ابحث عن العميل:",
                        style: AppTextStyles.styleSemiBold16(context),
                      ),
                      AddOfferBtn(
                        text: "إضافة عميل",
                        onTap: () {
                          context.push('/addcustomerview');
                        },
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(4),
                      vertical: SizeConfig.h(20),
                    ),
                    child: CustomSearchPerson(
                      hintText: "ابحث بالاسم أو رقم الهاتف",
                      onChanged: onSearchChanged,
                    ),
                  ),

                  /// filter
                   if (!isSearching)
                  FilterOption(
                    value: selected,
                    items: const ["نشط", "غير نشط"],
                    onChanged: (val) {
                      if (val != null) onFilterChanged(val);
                    },
                  ),

                  SizedBox(height: SizeConfig.h(20)),
                ],
              ),
            ),

            /// 🔄 loading
            if (state is UsersLoading)
              UserShimmerList()
            /// ❌ error
            else if (state is UsersError)
              SliverFillRemaining(
                child: Center(child: ErrorText(message: state.message)),
              )
            /// ✅ success
            else if (state is UsersSuccess)
              state.users.isEmpty
                  ? const SliverFillRemaining(
                      child: Center(
                        child: ErrorText(message: "لا يوجد مستخدمين"),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final user = state.users[index];

                        return Padding(
                          padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                          child: CustomerCard(user: user),
                        );
                      }, childCount: state.users.length),
                    )
            else
              const SliverToBoxAdapter(child: SizedBox()),
          ],
        );
      },
    );
  }
}
