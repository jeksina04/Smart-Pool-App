import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ServiceTypeBottomSheet extends StatelessWidget {
  final String selectedServiceType;
  final ValueChanged<String> onServiceTypeSelected;

  const ServiceTypeBottomSheet({
    super.key,
    required this.selectedServiceType,
    required this.onServiceTypeSelected,
  });

  // --> Replace with actual service types
  static const List<String> _serviceTypes = [
    'Routine clean',
    'Repair',
    'Green pool recovery',
    'Equipment check',
    'Reschedule a visit',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 40,
                offset: Offset(0, 16))
          ]),
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            8.verticalSpace,

            Container(
              width: 36.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.dividerColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            16.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.getString('service_type'),
                  style: AppTypography.poolCareSupport,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      padding: EdgeInsets.all(12.w),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.cardShadow,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        AppAssets.icClose,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            16.verticalSpace,

            // --> Service Type List
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cardShadow,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  for (int i = 0; i < _serviceTypes.length; i++)
                    _buildItem(
                      context,
                      _serviceTypes[i],
                      isLast: i == _serviceTypes.length - 1,
                    ),
                ],
              ),
            ),
            16.verticalSpace,

            Text(
              context.getString('service_type_disclaimer'),
              style: AppTypography.dividerText,
            ),
            8.verticalSpace,
          ],
        ),
      ),
    );
  }

  // --> Service Type Item
  Widget _buildItem(
    BuildContext context,
    String serviceType, {
    bool isLast = false,
  }) {
    final bool isSelected = serviceType == selectedServiceType;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 4.h,
          ),
          title: Text(serviceType, style: AppTypography.sectionHeader),
          trailing: isSelected
              ? SvgPicture.asset(
                  AppAssets.icCheck,
                )
              : null,
          onTap: () {
            onServiceTypeSelected(serviceType);
            Navigator.pop(context);
          },
        ),
        if (!isLast)
          const Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
      ],
    );
  }
}
