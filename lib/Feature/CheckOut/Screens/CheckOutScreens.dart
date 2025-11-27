import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Widgets/BottomSheet.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';
import '../Widgets/CheckItem.dart';
import '../Widgets/Radio.dart';
import '../Widgets/SaveCard.dart';

class Checkoutscreens extends StatelessWidget {
  const Checkoutscreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 20),
          onPressed: () => Navigator.pop(context),
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.black87,
            ),
          ),
        ),
        title: Custtomtext(
          text: 'Checkout',
          size: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Order Summary'),
            Gap(15),
            _buildOrderSummaryCard([
              CheckItem(title: 'Subtotal', price: '\$20.00'),
              CheckItem(title: 'Taxes', price: '\$3.00'),
              CheckItem(title: 'Delivery Fee', price: '\$1.50'),
            ]),

            Gap(20),

            _buildDeliveryTimeCard(),

            Gap(30),

            _buildSectionTitle('Payment Method'),
            Gap(15),

            _buildPaymentCard(),

            Gap(20),

            SaveCard(),

            Gap(100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Custtomtext(
      text: title,
      size: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );
  }

  Widget _buildOrderSummaryCard(List<Widget> items) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 8),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          ...items.map(
            (item) =>
                Padding(padding: EdgeInsets.only(bottom: 12), child: item),
          ),
          Divider(height: 24, thickness: 1.5),
          CheckItem(
            title: 'Total',
            price: '\$24.50',
            color: AppColors.primerycolor,
            size: 20,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryTimeCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primerycolor.withOpacity(0.1),
            AppColors.primerycolor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primerycolor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primerycolor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.access_time, color: Colors.white, size: 24),
          ),
          Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custtomtext(
                  text: 'Estimated Delivery',
                  size: 14,
                  color: Colors.grey[600]!,
                  fontWeight: FontWeight.w500,
                ),
                Gap(4),
                Custtomtext(
                  text: '15 - 30 minutes',
                  size: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primerycolor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 8),
            spreadRadius: 1,
          ),
        ],
      ),
      child: PaymentSelect(showCash: true, showVisa: true),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custtomtext(
                      text: 'Total Price',
                      size: 14,
                      color: Colors.grey[600]!,
                    ),
                    Gap(4),
                    Custtomtext(
                      text: '\$24.50',
                      size: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primerycolor,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primerycolor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor: AppColors.primerycolor.withOpacity(0.4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Pay Now',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Gap(8),
                      Icon(Icons.arrow_forward_rounded, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
