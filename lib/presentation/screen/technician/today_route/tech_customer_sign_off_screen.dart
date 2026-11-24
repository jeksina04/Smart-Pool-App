import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Stop detail — Customer sign-off"
/// Displays:
/// - Header Bar: Circular back button and "Customer sign-off" title
/// - Instruction caption: "Ask the customer to sign below — drag inside the box."
/// - Signature Box: Large rounded canvas box with drawing capability
/// - Customer name (optional) input field with user icon prefix
/// - Clear button (white pill) & Skip button (white pill)
/// - Accept Signature button (full-width primary blue pill)
class TechCustomerSignOffScreen extends StatefulWidget {
  const TechCustomerSignOffScreen({super.key});

  @override
  State<TechCustomerSignOffScreen> createState() =>
      _TechCustomerSignOffScreenState();
}

class _TechCustomerSignOffScreenState extends State<TechCustomerSignOffScreen> {
  final TextEditingController _nameController = TextEditingController();
  final List<Offset?> _points = [];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header Bar
            _buildHeaderBar(),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtitle caption
                    Text(
                      'Ask the customer to sign below — drag inside the box.',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7D8A99),
                      ),
                    ),
                    14.verticalSpace,

                    // Signature Drawing Box
                    _buildSignatureBox(),
                    16.verticalSpace,

                    // Customer name (optional) Field
                    _buildNameInputField(),
                    20.verticalSpace,

                    // Clear & Skip Action Buttons Row
                    _buildClearSkipRow(),
                    16.verticalSpace,

                    // Accept Signature Button
                    _buildAcceptSignatureButton(),
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
            'Customer sign-off',
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

  Widget _buildSignatureBox() {
    return Container(
      width: double.infinity,
      height: 240.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.r),
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox? renderBox = context.findRenderObject() as RenderBox?;
              if (renderBox != null) {
                _points.add(details.localPosition);
              }
            });
          },
          onPanEnd: (DragEndDetails details) {
            setState(() {
              _points.add(null);
            });
          },
          child: CustomPaint(
            painter: _SignaturePainter(points: _points),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }

  Widget _buildNameInputField() {
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
            Icons.person_outline_rounded,
            size: 20.w,
            color: const Color(0xFF7D8A99),
          ),
          12.horizontalSpace,
          Expanded(
            child: TextField(
              controller: _nameController,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 14.5.sp,
                color: AppColors.darkNavy,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: 'Customer name (optional)',
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

  Widget _buildClearSkipRow() {
    return Row(
      children: [
        // Clear Button
        Expanded(
          child: Container(
            height: 52.h,
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
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _points.clear();
                    _nameController.clear();
                  });
                },
                borderRadius: BorderRadius.circular(26.r),
                child: Center(
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        14.horizontalSpace,

        // Skip Button
        Expanded(
          child: Container(
            height: 52.h,
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
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.techCompleteJob);
                },
                borderRadius: BorderRadius.circular(26.r),
                child: Center(
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcceptSignatureButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.techCompleteJob);
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
          'Accept Signature',
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
}

class _SignaturePainter extends CustomPainter {
  final List<Offset?> points;

  _SignaturePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1B314B)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SignaturePainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
