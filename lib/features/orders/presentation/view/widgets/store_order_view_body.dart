import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/orders/domain/entities/order_status_extension.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order%20state.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_list_shimer.dart';
import 'package:plupool/features/orders/presentation/view/widgets/orders_list.dart';

class StoreOrderViewBody extends StatefulWidget {
  const StoreOrderViewBody({super.key});

  @override
  State<StoreOrderViewBody> createState() => _StoreOrderViewBodyState();
}

class _StoreOrderViewBodyState extends State<StoreOrderViewBody> {
  String selected = "قيد الانتظار";
  String _search = "";
  Timer? _debounce;
  bool get isSearching => _search.isNotEmpty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrdersCubit>().getOrders(status: orderStatusToApi(selected));
    });
  }

  void onSearchChanged(String value) {
    final cleaned = value.trim();

    setState(() {
      _search = cleaned;
    });

    print("SEARCH => '$cleaned'");

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<OrdersCubit>().getOrders(
        search: cleaned.isEmpty ? null : cleaned,
        status: cleaned.isEmpty
            ? orderStatusToApi(selected)
            : null, // 🔥 ثابت دايمًا
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            /// 🔍 title
            SliverToBoxAdapter(
              child: Text(
                "ابحث عن العميل:",
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
            ),

            /// 🔍 search
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CustomSearchPerson(
                  hintText: "ابحث باسم العميل او رقم الهاتف",
                  onChanged: onSearchChanged,
                ),
              ),
            ),

            /// 🎯 filter (نفس فكرة ratings)
            if (!isSearching)
              SliverToBoxAdapter(
                child: FilterOption(
                  value: selected,
                  items: const [
                    "قيد الانتظار",
                    "تم التأكيد",
                    "جاري التجهيز",
                    "تم الشحن",
                    "تم التسليم",
                    "ملغي",
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => selected = val);

                      context.read<OrdersCubit>().getOrders(
                        status: orderStatusToApi(val),
                        search: _search.isEmpty ? null : _search,
                      );
                    }
                  },
                ),
              ),
            SliverToBoxAdapter(child: SizedBox(height: 15)),

            /// 🔄 loading
            if (state is OrdersLoading)
              OrderListShimer()
            /// ❌ error
            else if (state is OrdersError)
              SliverFillRemaining(
                child: Center(child: ErrorText(message: state.message)),
              )
            /// ✅ success
            else if (state is OrdersSuccess)
              state.orders.isEmpty
                  ? const SliverFillRemaining(
                      child: Center(child: Text("لا توجد طلبات")),
                    )
                  : OrderList(orders: state.orders)
            else
              const SliverToBoxAdapter(child: SizedBox()),
          ],
        );
      },
    );
  }
}
