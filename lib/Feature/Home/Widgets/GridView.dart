import 'package:flutter/material.dart';
import 'package:hungery/Feature/Home/Screen/Cubit/HomeViewModel.dart';
import 'package:hungery/Feature/Home/Widgets/CardItems.dart';
import 'package:hungery/Feature/Products/Screen/ProductScreens.dart';

class CustomSliverGrid extends StatelessWidget {
  final HomeViewModel viewModel;

  const CustomSliverGrid({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 5, left: 5, bottom: 25),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) => InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductScreens(data: viewModel.products[index]),
              ),
            ),
            child: Carditems(data: viewModel.products[index]),
          ),
          childCount: 10,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.65,
        ),
      ),
    );
  }
}
