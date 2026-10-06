import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/request_service/widgets/photo_upload_section.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../dashboard/dashboard_page.dart';

class ServiceRequestForm extends StatelessWidget {
  const ServiceRequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(context, 'service_type_label'),
          _buildDropdownField(context),
          16.verticalSpace,
          _buildLabel(context, 'preferred_date_label'),
          _buildDatePickerField(context),
          16.verticalSpace,
          _buildLabel(context, 'notes_label'),
          _buildNotesField(context),
          16.verticalSpace,
          _buildLabel(context, 'photos_optional_label'),
          const PhotoUploadSection(),
          16.verticalSpace,
          _buildBookingNotice(context),
          16.verticalSpace,
          _buildSubmitButton(context),
          8.verticalSpace
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String key) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(context.getString(key), style: AppTypography.inputLabel),
    );
  }

  Widget _buildDropdownField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: _inputDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(""), // --> Selected value
          Icon(Icons.chevron_right, color: AppColors.textGrey, size: 20.sp),
        ],
      ),
    );
  }

  Widget _buildDatePickerField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: _inputDecoration(),
      child: Row(
        children: [
          Icon(Icons.calendar_today_outlined,
              color: AppColors.textGrey, size: 18.sp),
          12.horizontalSpace,
          Text(context.getString('select_date_hint'), style: AppTypography.inputHint.copyWith(color: AppColors.darkNavy)),
        ],
      ),
    );
  }

  Widget _buildNotesField(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
      ),
      child: TextField(
        maxLines: 4,
        decoration: InputDecoration(
          hintText: context.getString('notes_hint'),
          hintStyle: AppTypography.notesHint,
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildBookingNotice(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.h, 8.h),
      decoration: BoxDecoration(
        color: AppColors.infoBannerBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.icBell,
            colorFilter: const ColorFilter.mode(
                AppColors.infoBannerText, BlendMode.srcIn),
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(
              context.getString('booking_notice'),
              style: AppTypography.stripText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const DashboardPage(
                initialIndex: 1,
              ),
            ), (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
          elevation: 0,
        ),
        child: Text(context.getString('send_request_button'), style: AppTypography.signInButton),
      ),
    );
  }

  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(28.r),
      boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
    );
  }
}
