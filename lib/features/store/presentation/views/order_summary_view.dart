import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/split_phone.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_state.dart';
import 'package:plupool/features/store/presentation/views/widgets/address_card_shimmer.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_confirmation_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_summary_view_body.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_total_card_shimmer.dart';
import 'package:plupool/features/store/presentation/views/widgets/verified_btn.dart';

class OrderSummaryView extends StatefulWidget {
  const OrderSummaryView({super.key});

  @override
  State<OrderSummaryView> createState() => _OrderSummaryViewState();
}

class _OrderSummaryViewState extends State<OrderSummaryView> {
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  String selectedCountryCode = "+20";

  bool initialized = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<UserCubit>().fetchCurrentUser(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo",
      );
    });
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocListener<CartCubit, CartState>(
      listener: (context, cartState) {
        if (cartState.isOrderSuccess) {
          Navigator.pop(context);

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const OrderConfirmationCard(),
          );

          context.read<CartCubit>().clearOrderSuccess();
        }

        if (cartState.errorMessage != null) {
          showCustomSnackBar(
            context: context,
            message: cartState.errorMessage!,
          );

          context.read<CartCubit>().clearError();
        }
      },
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, userState) {
          if (userState is UserLoaded && !initialized) {
            initialized = true;

            addressController.text = userState.user.address;

            final phoneData = splitPhone2(userState.user.phone);

            phoneController.text = phoneData.number;
            selectedCountryCode = phoneData.countryCode.isEmpty
                ? "+20"
                : phoneData.countryCode;
          }

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.h(20),
                  left: SizeConfig.w(15),
                  right: SizeConfig.w(15),
                ),
                child: userState is UserLoaded
                    ? OrderSummaryViewBody(
                        user: userState.user,
                        addressController: addressController,
                        phoneController: phoneController,
                        selectedCountryCode: selectedCountryCode,
                        onCountryChanged: (code) {
                          setState(() {
                            selectedCountryCode = code;
                          });
                        },
                      )
                    : Column(
                        children: [
                          OrderTotalCardShimmer(),
                          SizedBox(height: SizeConfig.h(10)),
                          AddressCardShimmer(),
                          SizedBox(height: SizeConfig.h(10)),
                          AddressCardShimmer(),
                        ],
                      ),
              ),
            ),
            bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
              builder: (context, cartState) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(15),
                    vertical: SizeConfig.h(12),
                  ),
                  color: AppColors.kScaffoldColor,
                  child: SizedBox(
                    height: SizeConfig.h(50),
                    child: VerifiedBtn(
                      onPressed: cartState.isLoading
                          ? null
                          : () {
                              context.read<CartCubit>().confirmOrder(
                                address: addressController.text.trim(),
                                phone:
                                    "$selectedCountryCode ${phoneController.text.trim()}",
                              );
                            },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
