
import 'package:flutter/material.dart';
import 'package:hungery/Feature/OrderHistory/Widgets/ItemOrder.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Itemorder(
                  title: 'Hungery Burger',
                  count: 'Qta : 2',
                  price: '20.00 \$',
                  textButton: 'Reorder',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
