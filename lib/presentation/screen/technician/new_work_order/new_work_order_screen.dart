import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/new_work_order_header_bar.dart';
import 'widgets/quote_first_toggle_card.dart';
import 'widgets/selectable_field_tile.dart';

/// Screen for creating a "New work order"
class NewWorkOrderScreen extends StatefulWidget {
  const NewWorkOrderScreen({super.key});

  @override
  State<NewWorkOrderScreen> createState() => _NewWorkOrderScreenState();
}

class _NewWorkOrderScreenState extends State<NewWorkOrderScreen> {
  String? _selectedCustomer;
  String? _selectedWorkType;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _roughPriceController = TextEditingController();
  bool _needsQuoteFirst = true;

  @override
  void dispose() {
    _descriptionController.dispose();
    _roughPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with back button and title
            NewWorkOrderHeaderBar(
              onBack: () => Navigator.of(context).maybePop(),
            ),

            /// Scrollable Form Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 1. Customer selector
                    SelectableFieldTile(
                      label: 'Customer',
                      value: _selectedCustomer,
                      placeholder: 'Select customer',
                      onTap: () {
                        // Open customer selection dialog / sheet
                      },
                    ),
                    18.verticalSpace,

                    /// 2. Type of work selector
                    SelectableFieldTile(
                      label: 'Type of work',
                      value: _selectedWorkType,
                      placeholder: 'Select type of work',
                      onTap: () {
                        // Open type of work selection dialog / sheet
                      },
                    ),
                    18.verticalSpace,

                    /// 3. What needs doing (Multiline description)
                    Text(
                      'What needs doing',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    8.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 120.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                      child: TextField(
                        controller: _descriptionController,
                        maxLines: 5,
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 14.sp,
                          color: AppColors.darkNavy,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Describe it for the office',
                          hintStyle: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9AA5B5),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    18.verticalSpace,

                    /// 4. Rough price input
                    Text(
                      'Rough price',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    8.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 54.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(22.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x08102A50),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.credit_card_outlined,
                            size: 20.w,
                            color: const Color(0xFF9AA5B5),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: TextField(
                              controller: _roughPriceController,
                              style: TextStyle(
                                fontFamily: AppTypography.poppinsFont,
                                fontSize: 14.sp,
                                color: AppColors.darkNavy,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Leave blank if the office should quote it',
                                hintStyle: TextStyle(
                                  fontFamily: AppTypography.poppinsFont,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF9AA5B5),
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    18.verticalSpace,

                    /// 5. Needs a quote first toggle card
                    QuoteFirstToggleCard(
                      value: _needsQuoteFirst,
                      onChanged: (val) {
                        setState(() => _needsQuoteFirst = val);
                      },
                    ),
                    18.verticalSpace,

                    /// 6. Info banner callout
                    _buildInfoBanner(),
                    24.verticalSpace,

                    /// 7. Primary Action Button: "Send to office"
                    _buildSendToOfficeButton(),
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

  Widget _buildInfoBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF2FD),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Icon(
              Icons.article_outlined,
              size: 16.w,
              color: const Color(0xFF1B6BD8),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1B6BD8),
                  height: 1.35,
                ),
                children: const [
                  TextSpan(
                    text: 'Raised from the field, this arrives in the office as a ',
                  ),
                  TextSpan(
                    text: 'draft',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: '. Numbering, pricing, invoicing and scheduling all stay with the office.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendToOfficeButton() {
    return SizedBox(
      width: double.infinity,
      height: 54.h,
      child: ElevatedButton(
        onPressed: () {
          // Submit work order to office
          Navigator.of(context).maybePop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.r),
          ),
        ),
        child: Text(
          'Send to office',
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
