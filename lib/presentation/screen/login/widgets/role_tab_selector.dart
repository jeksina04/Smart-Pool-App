import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../bloc/login_event.dart';

/// Customer vs Technician role tab selector widget.
class RoleTabSelector extends StatelessWidget {
  final UserRole selectedRole;
  final ValueChanged<UserRole> onRoleChanged;

  const RoleTabSelector({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTabItem(
              context: context,
              role: UserRole.customer,
              title: context.getString('customer'),
              iconAsset: AppAssets.icCustomer,
            ),
          ),
          Expanded(
            child: _buildTabItem(
              context: context,
              role: UserRole.technician,
              title: context.getString('technician'),
              iconAsset: AppAssets.icTechnician,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required BuildContext context,
    required UserRole role,
    required String title,
    required String iconAsset,
  }) {
    final bool isSelected = selectedRole == role;

    return GestureDetector(
      onTap: () => onRoleChanged(role),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(22.r),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 18.w,
              height: 18.w,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.white : AppColors.darkNavy,
                BlendMode.srcIn,
              ),
            ),
            8.horizontalSpace,
            Text(
              title,
              style: isSelected
                  ? AppTypography.tabTextSelected
                  : AppTypography.tabTextUnselected,
            ),
          ],
        ),
      ),
    );
  }
}
