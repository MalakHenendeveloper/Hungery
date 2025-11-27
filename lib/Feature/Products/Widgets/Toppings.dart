import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungery/Feature/Products/Screen/Cubit/ProductState.dart';
import 'package:hungery/Feature/Products/Screen/Cubit/ProductViewModel.dart';
import 'package:hungery/Feature/Products/Widgets/Items.dart';

import 'package:skeletonizer/skeletonizer.dart';

class Toppings extends StatelessWidget {
  const Toppings({required this.viewModel, super.key});

  final ProductViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel, ProductState>(
      bloc: viewModel,
      buildWhen: (previous, current) =>
          current is ProductTopLoading ||
          current is ProductTopError ||
          current is ProductTopSuccess ||
          current is SelectionUpdated,
      builder: (context, state) {
        if (state is ProductTopLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => const Items(
                image: 'assets/images/pizza.png', // Placeholder image
                title: 'Loading...',
              ),
            ),
          );
        }
        if (state is ProductTopError) {
          return Center(child: Text(state.message.ErrorMassage));
        }
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: 0.95 + (value * 0.05),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.topList.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.topList[index];
                    final isSelected = viewModel.selectedToppings.contains(
                      item.id,
                    );
                    return Items(
                      image: item.image!,
                      title: item.name!,
                      isSelected: isSelected,
                      onTap: () => viewModel.toggleTopping(item.id!),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
