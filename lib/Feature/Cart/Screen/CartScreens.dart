import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungery/Core/Injectable/Injectable.dart';
import 'package:hungery/Core/Routes/App_Routes.dart';
import 'package:hungery/Core/Widgets/BottomSheet.dart';
import 'package:hungery/Feature/Cart/Screen/Cubit/CartState.dart';
import 'package:hungery/Feature/Cart/Screen/Cubit/CartViewModel.dart';
import 'package:hungery/Feature/Cart/Widgets/CartItem.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Cartscreens extends StatelessWidget {
  Cartscreens({super.key});

  var viewmodel = getIt<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartState>(
      bloc: viewmodel..getCart(),
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: LoadingAnimationWidget.twistingDots(
              leftDotColor: const Color(0xff08431D),
              rightDotColor: const Color(0xffF3F4F6),
              size: 120,
            ),
          );
        } else if (state is CartSuccess) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                children: [
                  Expanded(
                    child: viewmodel.cartList.isEmpty
                        ? Center(
                            child: TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0.0, end: 1.0),
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeOutBack,
                              builder: (context, value, child) {
                                return Opacity(
                                  opacity: value.clamp(0.0, 1.0),
                                  child: Transform.scale(
                                    scale: value.clamp(0.0, 1.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 10,
                                              sigmaY: 10,
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.all(40),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                  colors: [
                                                    const Color(
                                                      0xff08431D,
                                                    ).withOpacity(0.15),
                                                    const Color(
                                                      0xff08431D,
                                                    ).withOpacity(0.08),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  width: 1.5,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.shopping_cart_outlined,
                                                size: 70,
                                                color: const Color(0xff08431D),
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 32),

                                        Text(
                                          'Your Cart is Empty',
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[900],
                                            letterSpacing: 0.5,
                                          ),
                                        ),

                                        const SizedBox(height: 12),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                          ),
                                          child: Text(
                                            'Explore our menu and add\ndelicious items to your cart',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[600],
                                              height: 1.5,
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 40),

                                        TweenAnimationBuilder<double>(
                                          tween: Tween(begin: 0.0, end: 1.0),
                                          duration: const Duration(
                                            milliseconds: 600,
                                          ),
                                          curve: Curves.elasticOut,
                                          builder: (context, buttonValue, child) {
                                            return Transform.scale(
                                              scale: (0.8 + (buttonValue * 0.2))
                                                  .clamp(0.8, 1.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                    sigmaX: 10,
                                                    sigmaY: 10,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            16,
                                                          ),
                                                      border: Border.all(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        width: 1.5,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: const Color(
                                                            0xff08431D,
                                                          ).withOpacity(0.25),
                                                          blurRadius: 20,
                                                          offset: const Offset(
                                                            0,
                                                            10,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    child: ElevatedButton.icon(
                                                      onPressed: () {
                                                        Navigator.pushReplacementNamed(
                                                          context,
                                                          App_Routes.main,
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons.restaurant_menu,
                                                        size: 22,
                                                      ),
                                                      label: const Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 4,
                                                            ),
                                                        child: Text(
                                                          'Browse Menu',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                              0xff08431D,
                                                            ),
                                                        foregroundColor:
                                                            Colors.white,
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 40,
                                                              vertical: 16,
                                                            ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                16,
                                                              ),
                                                        ),
                                                        elevation: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : ListView.builder(
                            itemCount: viewmodel.cartList.length,
                            itemBuilder: (context, index) {
                              final item = viewmodel.cartList[index];
                              return CartItem(
                                data: item,
                                onIncrement: () =>
                                    viewmodel.incrementQuantity(item.itemId!),
                                onDecrement: () =>
                                    viewmodel.decrementQuantity(item.itemId!),
                                delete: () {
                                  viewmodel.deleteCart(item.itemId!);
                                },
                              );
                            },
                          ),
                  ),
                  if (viewmodel.cartList.isNotEmpty)
                    CustomBottomSheet(
                      onTap: () =>
                          Navigator.pushNamed(context, App_Routes.chekout),
                      height: 55,
                      title: 'Total',
                      trailing: 'Check Out',
                      subtitle: '\$ ${viewmodel.getTotalPrice()}',
                    ),
                ],
              ),
            ),
          );
        } else if (state is CartError) {
          return Center(child: Text(''));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
