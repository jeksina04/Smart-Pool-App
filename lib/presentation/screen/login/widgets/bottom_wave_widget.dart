import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../bloc/login_event.dart';

/// Bottom footer text widget rendered on top of the bottom wave background.
class BottomWaveWidget extends StatelessWidget {
  final UserRole role;
  final VoidCallback onCreateAccountTap;

  const BottomWaveWidget({
    super.key,
    required this.role,
    required this.onCreateAccountTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 24.h),
      child: role == UserRole.customer
          ? _buildCustomerFooter(context)
          : _buildTechnicianFooter(context),
    );
  }

  Widget _buildCustomerFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.getString('dont_have_account'),
          style: AppTypography.bottomTextNormal,
        ),
        GestureDetector(
          onTap: onCreateAccountTap,
          child: Text(
            context.getString('create_an_account'),
            style: AppTypography.bottomTextHighlight,
          ),
        ),
      ],
    );
  }

  Widget _buildTechnicianFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.verified_user_outlined,
          size: 14.w,
          color: AppColors.textGrey,
        ),
        6.horizontalSpace,
        Flexible(
          child: Text(
            context.getString('technician_dispatch_notice'),
            style: AppTypography.technicianNotice,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
