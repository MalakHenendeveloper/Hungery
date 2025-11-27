import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/Core/Widgets/CusttomText.dart';
import 'package:hungery/Core/constants/colors.dart';
import 'package:hungery/Core/constants/images.dart';

import '../../CheckOut/Widgets/Radio.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(20),

              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppImages.sonic),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: AppColors.primerycolor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(30),

              _buildSectionTitle('Personal Information'),
              Gap(10),
              _buildModernCard(
                child: Column(
                  spacing: 15,
                  children: [
                    _buildInfoRow(
                      Icons.person_outline,
                      'Full Name',
                      'Malak Henen',
                    ),
                    Divider(height: 1, color: Colors.grey[300]),
                    _buildInfoRow(
                      Icons.email_outlined,
                      'Email',
                      'malakhenen@gmail.com',
                    ),
                    Divider(height: 1, color: Colors.grey[300]),
                    _buildInfoRow(Icons.phone_outlined, 'Phone', '+01047822'),
                  ],
                ),
              ),

              Gap(25),

              _buildSectionTitle('Delivery Address'),
              Gap(10),
              _buildModernCard(
                child: _buildInfoRow(
                  Icons.location_on_outlined,
                  'Address',
                  'New York',
                ),
              ),

              Gap(25),

              _buildSectionTitle('Payment Method'),
              Gap(10),
              _buildModernCard(
                child: PaymentSelect(showCash: false, showVisa: true),
              ),

              Gap(25),

              _buildSectionTitle('Account Actions'),
              Gap(10),

              _buildActionCard(
                icon: Icons.lock_outline,
                title: 'Change Password',
                subtitle: 'Update your password',
                color: Colors.blue,
              ),
              Gap(10),

              _buildActionCard(
                icon: Icons.logout,
                title: 'Logout',
                subtitle: 'Sign out of your account',
                color: Colors.red,
              ),

              Gap(100),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.primerycolor,
        icon: Icon(Icons.edit, color: Colors.white),
        label: Custtomtext(
          text: 'Edit Profile',
          color: Colors.white,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        elevation: 8,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Custtomtext(
      text: title,
      color: Colors.black87,
      size: 18,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _buildModernCard({required Widget child}) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primerycolor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primerycolor, size: 20),
        ),
        Gap(15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custtomtext(text: label, color: Colors.grey[600]!, size: 12),
              Gap(3),
              Custtomtext(
                text: value,
                color: Colors.black87,
                size: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          Gap(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custtomtext(
                  text: title,
                  color: Colors.black87,
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
                Gap(3),
                Custtomtext(text: subtitle, color: Colors.grey[600]!, size: 13),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
        ],
      ),
    );
  }
}
