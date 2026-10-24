import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/add_customer_header_bar.dart';

/// Screen: "Add customer"
/// Allows technician to add customer details, property info, pool specs, and service contracts.
class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _gateCodeController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController(text: '10,000');
  final TextEditingController _rateController = TextEditingController(text: '85.00');

  String? _selectedSanitiser = 'Chlorine';
  int _selectedFrequency = 0; // 0: Weekly, 1: Biweekly, 2: Monthly
  String _selectedServiceDay = 'Friday';
  bool _inviteToApp = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _gateCodeController.dispose();
    _volumeController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with back button & title
            AddCustomerHeaderBar(
              onBack: () => Navigator.of(context).maybePop(),
            ),

            // Scrollable Form Body
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtitle explanation text
                    Text(
                      'Creating a customer also creates their property, their pool and a service contract with NSP Pool & Spa Services.',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                        height: 1.45,
                      ),
                    ),
                    20.verticalSpace,

                    // ── 1. CUSTOMER SECTION ─────────────────────────────
                    _buildSectionHeader('Customer'),
                    12.verticalSpace,

                    _buildFieldLabel('Full name'),
                    6.verticalSpace,
                    _buildPillTextField(
                      controller: _fullNameController,
                      hintText: 'e.g. Alicia Keys',
                      prefixIcon: Icons.person_outline_rounded,
                    ),
                    14.verticalSpace,

                    _buildFieldLabel('Mobile'),
                    6.verticalSpace,
                    _buildPillTextField(
                      controller: _mobileController,
                      hintText: '(555) 000 0000',
                      prefixIcon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),
                    14.verticalSpace,

                    _buildFieldLabel('Email'),
                    6.verticalSpace,
                    _buildPillTextField(
                      controller: _emailController,
                      hintText: 'name@example.com',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    24.verticalSpace,

                    // ── 2. PROPERTY SECTION ─────────────────────────────
                    _buildSectionHeader('Property'),
                    12.verticalSpace,

                    _buildFieldLabel('Address'),
                    6.verticalSpace,
                    _buildPillTextField(
                      controller: _addressController,
                      hintText: 'Street, city, state',
                      prefixIcon: Icons.location_on_outlined,
                    ),
                    14.verticalSpace,

                    _buildFieldLabel('Gate code (optional)'),
                    6.verticalSpace,
                    _buildPillTextField(
                      controller: _gateCodeController,
                      hintText: 'e.g. #1324',
                      prefixIcon: Icons.lock_outline_rounded,
                    ),
                    24.verticalSpace,

                    // ── 3. POOL SECTION ─────────────────────────────────
                    _buildSectionHeader('Pool'),
                    12.verticalSpace,

                    Row(
                      children: [
                        // Volume Field
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Volume'),
                              6.verticalSpace,
                              Container(
                                height: 50.h,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(25.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x06102A50),
                                      blurRadius: 8,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _volumeController,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          fontFamily: AppTypography.poppinsFont,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.darkNavy,
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'gal',
                                      style: TextStyle(
                                        fontFamily: AppTypography.poppinsFont,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        14.horizontalSpace,

                        // Sanitiser Field
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Sanitiser'),
                              6.verticalSpace,
                              InkWell(
                                onTap: _showSanitiserPicker,
                                borderRadius: BorderRadius.circular(25.r),
                                child: Container(
                                  height: 50.h,
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(25.r),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x06102A50),
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _selectedSanitiser ?? 'Select',
                                        style: TextStyle(
                                          fontFamily: AppTypography.poppinsFont,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.darkNavy,
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        size: 20.w,
                                        color: const Color(0xFF9AA5B5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    24.verticalSpace,

                    // ── 4. SERVICE SECTION ──────────────────────────────
                    _buildSectionHeader('Service'),
                    12.verticalSpace,

                    _buildFieldLabel('Frequency'),
                    8.verticalSpace,

                    // Frequency Segmented Control: Weekly | Biweekly | Monthly
                    Container(
                      width: double.infinity,
                      height: 48.h,
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x06102A50),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          _buildFrequencyButton('Weekly', 0),
                          _buildFrequencyButton('Biweekly', 1),
                          _buildFrequencyButton('Monthly', 2),
                        ],
                      ),
                    ),
                    8.verticalSpace,

                    // Helper note
                    Text(
                      'Winter customers often move to biweekly — the frequency can be changed later without ending the contract.',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                        height: 1.4,
                      ),
                    ),
                    16.verticalSpace,

                    Row(
                      children: [
                        // Service Day Selector
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Service day'),
                              6.verticalSpace,
                              InkWell(
                                onTap: _showServiceDayPicker,
                                borderRadius: BorderRadius.circular(25.r),
                                child: Container(
                                  height: 50.h,
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(25.r),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x06102A50),
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 18.w,
                                        color: const Color(0xFF7A8A9E),
                                      ),
                                      10.horizontalSpace,
                                      Text(
                                        _selectedServiceDay,
                                        style: TextStyle(
                                          fontFamily: AppTypography.poppinsFont,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.darkNavy,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        14.horizontalSpace,

                        // Rate Field
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Rate'),
                              6.verticalSpace,
                              Container(
                                height: 50.h,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(25.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x06102A50),
                                      blurRadius: 8,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.credit_card_outlined,
                                      size: 18.w,
                                      color: const Color(0xFF7A8A9E),
                                    ),
                                    10.horizontalSpace,
                                    Expanded(
                                      child: TextField(
                                        controller: _rateController,
                                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                        style: TextStyle(
                                          fontFamily: AppTypography.poppinsFont,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.darkNavy,
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,

                    // ── 5. INVITE THEM TO THE APP CARD ──────────────────
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x06102A50),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Invite them to the app',
                                  style: TextStyle(
                                    fontFamily: AppTypography.poppinsFont,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.darkNavy,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  'Texts a link they can claim at the door — the best moment you will get',
                                  style: TextStyle(
                                    fontFamily: AppTypography.poppinsFont,
                                    fontSize: 11.5.sp,
                                    color: AppColors.textGrey,
                                    height: 1.35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.horizontalSpace,
                          CupertinoSwitch(
                            value: _inviteToApp,
                            activeColor: AppColors.primaryBlue,
                            onChanged: (val) {
                              setState(() => _inviteToApp = val);
                            },
                          ),
                        ],
                      ),
                    ),
                    24.verticalSpace,

                    // ── 6. PRIMARY "ADD CUSTOMER" BUTTON ────────────────
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).maybePop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.r),
                          ),
                        ),
                        child: Text(
                          'Add customer',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppTypography.poppinsFont,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.darkNavy,
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontFamily: AppTypography.poppinsFont,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.darkNavy,
      ),
    );
  }

  Widget _buildPillTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.darkNavy,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 14.sp,
            color: const Color(0xFF8A99AD),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 14.w, right: 10.w),
            child: Icon(
              prefixIcon,
              size: 20.w,
              color: const Color(0xFF7A8A9E),
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 44.w),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
      ),
    );
  }

  Widget _buildFrequencyButton(String title, int index) {
    final isSelected = _selectedFrequency == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() => _selectedFrequency = index);
        },
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.5.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              color: isSelected ? AppColors.white : AppColors.darkNavy,
            ),
          ),
        ),
      ),
    );
  }

  void _showSanitiserPicker() {
    final options = ['Chlorine', 'Saltwater', 'Mineral', 'Bromine', 'Ozone'];
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      backgroundColor: AppColors.white,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: Text(
                  'Select Sanitiser',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1, color: Color(0xFFEFF2F6)),
              ...options.map((opt) {
                final isSelected = opt == _selectedSanitiser;
                return ListTile(
                  title: Text(
                    opt,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.sp,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected ? AppColors.primaryBlue : AppColors.darkNavy,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_rounded, color: AppColors.primaryBlue)
                      : null,
                  onTap: () {
                    setState(() => _selectedSanitiser = opt);
                    Navigator.of(context).pop();
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }

  void _showServiceDayPicker() {
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      backgroundColor: AppColors.white,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: Text(
                  'Select Service Day',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1, color: Color(0xFFEFF2F6)),
              ...days.map((day) {
                final isSelected = day == _selectedServiceDay;
                return ListTile(
                  title: Text(
                    day,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.sp,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected ? AppColors.primaryBlue : AppColors.darkNavy,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_rounded, color: AppColors.primaryBlue)
                      : null,
                  onTap: () {
                    setState(() => _selectedServiceDay = day);
                    Navigator.of(context).pop();
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
