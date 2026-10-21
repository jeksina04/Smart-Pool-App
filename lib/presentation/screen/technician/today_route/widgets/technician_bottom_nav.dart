import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';

/// Bottom Navigation Bar tailored for the Technician view
class TechnicianBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const TechnicianBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFEFF2F6), width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildItem(
                index: 0,
                label: 'Today',
                iconWidget: SvgPicture.asset(
                  AppAssets.icRoute,
                  width: 22.w,
                  height: 22.w,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 0 ? AppColors.primaryBlue : AppColors.textGrey,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              _buildItem(
                index: 1,
                label: 'Map',
                iconWidget: Icon(
                  Icons.location_on_outlined,
                  size: 24.w,
                  color: currentIndex == 1 ? AppColors.primaryBlue : AppColors.textGrey,
                ),
              ),
              _buildItem(
                index: 2,
                label: 'Customers',
                iconWidget: Icon(
                  Icons.person_outline_rounded,
                  size: 24.w,
                  color: currentIndex == 2 ? AppColors.primaryBlue : AppColors.textGrey,
                ),
              ),
              _buildItem(
                index: 3,
                label: 'More',
                iconWidget: Icon(
                  Icons.menu_rounded,
                  size: 24.w,
                  color: currentIndex == 3 ? AppColors.primaryBlue : AppColors.textGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem({
    required int index,
    required String label,
    required Widget iconWidget,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected ? AppColors.primaryBlue : AppColors.textGrey;

    return InkWell(
      onTap: () => onTap(index),
      child: SizedBox(
        width: 70.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            2.verticalSpace,
            Text(
              label,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 11.sp,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
