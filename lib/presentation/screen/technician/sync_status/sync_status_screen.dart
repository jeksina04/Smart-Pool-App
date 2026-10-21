import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/sync_item_row.dart';
import 'widgets/sync_status_header_bar.dart';

/// Screen: "Sync status" for technician offline & cloud sync overview
class SyncStatusScreen extends StatefulWidget {
  const SyncStatusScreen({super.key});

  @override
  State<SyncStatusScreen> createState() => _SyncStatusScreenState();
}

class _SyncStatusScreenState extends State<SyncStatusScreen> {
  bool _isPrimaryDevice = true;

  final List<SyncItemModel> _syncJobs = const [
    SyncItemModel(
      title: 'Job · A. Keys',
      iconType: SyncItemIconType.document,
      badgeType: SyncItemBadgeType.queued,
      badgeText: 'Queued',
    ),
    SyncItemModel(
      title: 'Photos ×6',
      iconType: SyncItemIconType.camera,
      badgeType: SyncItemBadgeType.percentage,
      badgeText: '40%',
    ),
    SyncItemModel(
      title: 'Job · Roth',
      iconType: SyncItemIconType.document,
      badgeType: SyncItemBadgeType.synced,
      badgeText: 'Synced',
    ),
    SyncItemModel(
      title: 'Job · Hull',
      iconType: SyncItemIconType.document,
      badgeType: SyncItemBadgeType.retry,
      badgeText: 'Retry',
    ),
  ];

  final List<SyncItemModel> _webSyncItems = const [
    SyncItemModel(
      title: 'Data synced from web',
      iconType: SyncItemIconType.cloud,
      trailingText: 'Today 7:59 AM',
    ),
    SyncItemModel(
      title: 'Data synced to web',
      iconType: SyncItemIconType.cloud,
      trailingText: 'Today 7:59 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with back button and centered title
            SyncStatusHeaderBar(
              onBack: () => Navigator.of(context).maybePop(),
            ),

            /// Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 1. Offline Banner Callout
                    _buildOfflineBanner(),
                    16.verticalSpace,

                    /// 2. Pending Overview Card
                    _buildPendingOverviewCard(),
                    16.verticalSpace,

                    /// 3. Jobs / Photos Sync List Card
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x08102A50),
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: List.generate(_syncJobs.length, (index) {
                          final item = _syncJobs[index];
                          return Column(
                            children: [
                              SyncItemRow(item: item),
                              if (index != _syncJobs.length - 1)
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Color(0xFFF0F3F6),
                                ),
                            ],
                          );
                        }),
                      ),
                    ),
                    16.verticalSpace,

                    /// 4. Web Sync Status Card
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x08102A50),
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: List.generate(_webSyncItems.length, (index) {
                          final item = _webSyncItems[index];
                          return Column(
                            children: [
                              SyncItemRow(item: item),
                              if (index != _webSyncItems.length - 1)
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Color(0xFFF0F3F6),
                                ),
                            ],
                          );
                        }),
                      ),
                    ),
                    16.verticalSpace,

                    /// 5. Primary device for route Card with Toggle
                    _buildPrimaryDeviceCard(),
                    24.verticalSpace,

                    /// 6. Bottom Primary "Sync Now" button
                    _buildSyncNowButton(),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfflineBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFECEB),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.cloud_off_outlined,
            size: 18.w,
            color: const Color(0xFFD32F2F),
          ),
          8.horizontalSpace,
          Text(
            'Offline · last sync 42m ago',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFD32F2F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingOverviewCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pending',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
          ),
          4.verticalSpace,
          Text(
            '3 jobs · 11 photos · 2 items',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.darkNavy,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryDeviceCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Primary device for route',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'Turn this on for the one device you work from. If you use both a phone and a tablet, only one should be on — otherwise your route stops duplicate.',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          12.horizontalSpace,
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Switch(
              value: _isPrimaryDevice,
              onChanged: (val) {
                setState(() => _isPrimaryDevice = val);
              },
              activeColor: AppColors.white,
              activeTrackColor: AppColors.primaryBlue,
              inactiveThumbColor: AppColors.white,
              inactiveTrackColor: const Color(0xFFD8DFE7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncNowButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          // Trigger sync
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sync_rounded,
              size: 20.w,
              color: AppColors.white,
            ),
            8.horizontalSpace,
            Text(
              'Sync Now',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
