import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Add equipment"
/// Form allowing technicians to add pool equipment with type, manufacturer, model,
/// serial number, installed date, warranty expires, photo upload, info banner, and save button.
class TechAddEquipmentScreen extends StatefulWidget {
  const TechAddEquipmentScreen({super.key});

  @override
  State<TechAddEquipmentScreen> createState() => _TechAddEquipmentScreenState();
}

class _TechAddEquipmentScreenState extends State<TechAddEquipmentScreen> {
  final TextEditingController _manufacturerController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _serialController = TextEditingController();
  final TextEditingController _installedController = TextEditingController();
  final TextEditingController _warrantyController = TextEditingController();

  String? _selectedEquipmentType;

  @override
  void dispose() {
    _manufacturerController.dispose();
    _modelController.dispose();
    _serialController.dispose();
    _installedController.dispose();
    _warrantyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header Bar with circular back button and "Add equipment" title
            _buildHeaderBar(),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Equipment type
                    _buildFieldLabel('Equipment type'),
                    8.verticalSpace,
                    _buildDropdownOrPickerField(
                      hint: _selectedEquipmentType ?? '',
                      onTap: _showEquipmentTypePicker,
                      hasChevron: true,
                    ),
                    18.verticalSpace,

                    // 2. Manufacturer
                    _buildFieldLabel('Manufacturer'),
                    8.verticalSpace,
                    _buildTextInputField(
                      controller: _manufacturerController,
                      hintText: 'Pentair, Hayward, Jandy...',
                    ),
                    18.verticalSpace,

                    // 3. Model
                    _buildFieldLabel('Model'),
                    8.verticalSpace,
                    _buildTextInputField(
                      controller: _modelController,
                      hintText: 'As printed on the label',
                    ),
                    18.verticalSpace,

                    // 4. Serial number
                    _buildFieldLabel('Serial number'),
                    8.verticalSpace,
                    _buildIconInputField(
                      controller: _serialController,
                      hintText: 'Scan or type',
                      prefixIcon: Icons.camera_alt_outlined,
                    ),
                    18.verticalSpace,

                    // 5. Installed
                    _buildFieldLabel('Installed'),
                    8.verticalSpace,
                    _buildDatePickerField(
                      controller: _installedController,
                      hintText: 'Approximate is fine',
                    ),
                    18.verticalSpace,

                    // 6. Warranty expires
                    _buildFieldLabel('Warranty expires'),
                    8.verticalSpace,
                    _buildDatePickerField(
                      controller: _warrantyController,
                      hintText: 'If known',
                    ),
                    20.verticalSpace,

                    // 7. Photo of the data plate
                    _buildFieldLabel('Photo of the data plate'),
                    10.verticalSpace,
                    _buildPhotoUploadBox(),
                    18.verticalSpace,

                    // 8. Info Banner
                    _buildInfoBanner(),
                    24.verticalSpace,

                    // 9. Save equipment Button
                    _buildSaveButton(),
                    24.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).maybePop(),
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0C102A50),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18.w,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Add equipment',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 17.5.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontFamily: AppTypography.poppinsFont,
        fontSize: 14.5.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkNavy,
      ),
    );
  }

  Widget _buildDropdownOrPickerField({
    required String hint,
    required VoidCallback onTap,
    bool hasChevron = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        width: double.infinity,
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(26.r),
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
            Expanded(
              child: Text(
                hint.isEmpty ? 'Select equipment type' : hint,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 14.sp,
                  color: hint.isEmpty
                      ? const Color(0xFF9AA5B5)
                      : AppColors.darkNavy,
                  fontWeight:
                      hint.isEmpty ? FontWeight.w400 : FontWeight.w600,
                ),
              ),
            ),
            if (hasChevron)
              Icon(
                Icons.chevron_right_rounded,
                size: 22.w,
                color: const Color(0xFF9AA5B5),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInputField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      width: double.infinity,
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 14.sp,
            color: AppColors.darkNavy,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 14.sp,
              color: const Color(0xFF9AA5B5),
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  Widget _buildIconInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
  }) {
    return Container(
      width: double.infinity,
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
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
            prefixIcon,
            size: 20.w,
            color: const Color(0xFF7D8A99),
          ),
          12.horizontalSpace,
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 14.sp,
                color: AppColors.darkNavy,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 14.sp,
                  color: const Color(0xFF7D8A99),
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePickerField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2040),
        );
        if (date != null) {
          setState(() {
            controller.text =
                '${date.day} ${_monthName(date.month)} ${date.year}';
          });
        }
      },
      borderRadius: BorderRadius.circular(26.r),
      child: Container(
        width: double.infinity,
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(26.r),
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
            SvgPicture.asset(
              AppAssets.icInstall,
              width: 19.w,
              height: 19.w,
              colorFilter: const ColorFilter.mode(
                Color(0xFF7D8A99),
                BlendMode.srcIn,
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Text(
                controller.text.isEmpty ? hintText : controller.text,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 14.sp,
                  color: controller.text.isEmpty
                      ? const Color(0xFF7D8A99)
                      : AppColors.darkNavy,
                  fontWeight: controller.text.isEmpty
                      ? FontWeight.w400
                      : FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoUploadBox() {
    return Container(
      width: 76.w,
      height: 76.w,
      decoration: BoxDecoration(
        color: const Color(0xFF90B9F7),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14102A50),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16.r),
          child: Center(
            child: Icon(
              Icons.camera_alt_outlined,
              size: 26.w,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: SvgPicture.asset(
              AppAssets.icLock,
              width: 14.w,
              height: 14.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  color: AppColors.primaryBlue,
                  height: 1.45,
                ),
                children: const [
                  TextSpan(text: 'Equipment belongs to the '),
                  TextSpan(
                    text: 'pool',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text:
                        ', not to the contract. If this customer changes company, the serial, install date and warranty go with the pool — which is exactly what makes a warranty claim survive a switch.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
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
          'Save equipment',
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 15.5.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  void _showEquipmentTypePicker() {
    final types = ['Pump', 'Filter', 'Salt cell', 'Heater', 'Cleaner', 'Automation'];
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      backgroundColor: AppColors.white,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              12.verticalSpace,
              Container(
                width: 36.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9DFE8),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              16.verticalSpace,
              Text(
                'Select Equipment Type',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                ),
              ),
              12.verticalSpace,
              ...types.map(
                (t) => ListTile(
                  title: Text(
                    t,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkNavy,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedEquipmentType = t;
                    });
                    Navigator.pop(ctx);
                  },
                ),
              ),
              12.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}
