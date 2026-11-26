import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Modal bottom sheet: "Stop · [Customer Name]" options
/// Displays options: Skip this stop, Message the office, Reassign this stop (lead), and Cancel
class StopDetailOptionsBottomSheet extends StatelessWidget {
  final String customerName;
  final VoidCallback? onSkipStop;
  final VoidCallback? onMessageOffice;
  final VoidCallback? onReassignStop;

  const StopDetailOptionsBottomSheet({
    super.key,
    required this.customerName,
    this.onSkipStop,
    this.onMessageOffice,
    this.onReassignStop,
  });

  static Future<void> show(
    BuildContext context, {
    required String customerName,
    VoidCallback? onSkipStop,
    VoidCallback? onMessageOffice,
    VoidCallback? onReassignStop,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => StopDetailOptionsBottomSheet(
        customerName: customerName,
        onSkipStop: onSkipStop,
        onMessageOffice: onMessageOffice,
        onReassignStop: onReassignStop,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Amber/Orange Tag: "Not in Figma — the APIs exist"
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3E2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'Not in Figma — the APIs exist',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFB57008),
                  ),
                ),
              ),
              12.verticalSpace,

              // 2. Title: "Stop · [Customer Name]"
              Text(
                'Stop · $customerName',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkNavy,
                ),
              ),
              16.verticalSpace,

              // 3. Option: "Skip this stop"
              _buildOptionButton(
                context: context,
                title: 'Skip this stop',
                onTap: () {
                  Navigator.pop(context);
                  onSkipStop?.call();
                },
              ),
              10.verticalSpace,

              // 4. Option: "Message the office"
              _buildOptionButton(
                context: context,
                title: 'Message the office',
                onTap: () {
                  Navigator.pop(context);
                  onMessageOffice?.call();
                },
              ),
              10.verticalSpace,

              // 5. Option: "Reassign this stop (lead)"
              _buildOptionButton(
                context: context,
                title: 'Reassign this stop (lead)',
                onTap: () {
                  Navigator.pop(context);
                  onReassignStop?.call();
                },
              ),
              20.verticalSpace,

              // 6. Action: "Cancel"
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ),
              ),
              8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7FB),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.darkNavy,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
