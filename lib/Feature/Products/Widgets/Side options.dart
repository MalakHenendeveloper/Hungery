import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungery/Feature/Products/Screen/Cubit/ProductViewModel.dart';
import 'package:hungery/Feature/Products/Widgets/Items.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../Screen/Cubit/ProductState.dart';

class Sideoptions extends StatelessWidget {
  const Sideoptions({super.key, required this.viewModel});

  final ProductViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel, ProductState>(
      bloc: viewModel,
      buildWhen: (perv, cur) =>
          cur is ProductSideLoading ||
          cur is ProductSideSuccess ||
          cur is ProductSideError ||
          cur is SelectionUpdated,
      builder: (context, state) {
        if (state is ProductSideLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Items(
                  image: 'assets/images/pizza.png', // Placeholder image
                  title: 'Loading...',
                );
              },
            ),
          );
        }
        if (state is ProductSideError) {
          return Text(state.message.ErrorMassage);
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
                  itemCount: viewModel.sideList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = viewModel.sideList[index];
                    final isSelected = viewModel.selectedSideOptions.contains(
                      item.id,
                    );
                    return Items(
                      image: item.image!,
                      title: item.name!,
                      isSelected: isSelected,
                      onTap: () => viewModel.toggleSideOption(item.id!),
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
