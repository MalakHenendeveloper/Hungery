import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Injectable/Injectable.dart';

import 'package:hungery/Core/Widgets/BottomSheet.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Domian/Entities/Products/ProductsEntity.dart';
import 'package:hungery/Feature/Products/Screen/Cubit/ProductState.dart';
import 'package:hungery/Feature/Products/Screen/Cubit/ProductViewModel.dart';
import 'package:hungery/Core/Widgets/ModernFeedback.dart';
import 'package:hungery/Core/constants/colors.dart';

import 'package:hungery/Feature/Products/Widgets/Side%20options.dart';
import 'package:hungery/Feature/Products/Widgets/SpiceSlider.dart';
import 'package:hungery/Feature/Products/Widgets/Toppings.dart';

class ProductScreens extends StatelessWidget {
  ProductScreens({super.key, required this.data});

  final ProductDataEntity data;

  var viewModel = getIt<ProductViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductViewModel, ProductState>(
      bloc: viewModel
        ..getSide()
        ..getTop(),
      listener: (context, state) {
        if (state is AddToCartLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: AppColors.primerycolor),
            ),
          );
        }

        if (state is AddToCartError) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          ModernFeedback.show(
            context,
            title: "Cart Error",
            message: state.message.ErrorMassage,
            isSuccess: false,
          );
          print(state.message.ErrorMassage);
        }

        if (state is AddToCartSuccess) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          if (context.mounted) {
            ModernFeedback.show(
              context,
              title: "Success",
              message: "Item added to cart successfully",
              isSuccess: true,
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 35,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 30,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spiceslider(
                      value: viewModel.value,
                      onChanged: (v) => viewModel.ChengeSlider(v),
                      data: data,
                    ),

                    Gap(10),

                    Custtomtext(
                      text: 'Toppings',
                      size: 18,
                      fontWeight: FontWeight.w600,
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Toppings(viewModel: viewModel),
                    ),

                    Gap(10),

                    Custtomtext(
                      margin: EdgeInsets.only(top: 10),
                      text: 'SideOptions',
                      size: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Sideoptions(viewModel: viewModel),
                    ),

                    Gap(20),

                    CustomBottomSheet(
                      onTap: () {
                        viewModel.addToCart(
                          productId: data.id!,
                          quantity: viewModel.quantity,
                          spicy: viewModel.value,
                          toppings: viewModel.selectedToppings,
                          sideOptions: viewModel.selectedSideOptions,
                        );
                      },
                      height: 130,
                      title: 'Total',
                      trailing: 'ADD To Cart',
                      subtitle: '\$ 8.0',
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
