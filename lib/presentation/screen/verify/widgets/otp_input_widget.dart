import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

/// 4-digit OTP input widget with custom box shadow, selected border, and automatic focus progression.
class OtpInputWidget extends StatefulWidget {
  final ValueChanged<String> onOtpChanged;
  final ValueChanged<String>? onCompleted;
  final double? boxWidth;
  final double? boxHeight;

  const OtpInputWidget({
    super.key,
    required this.onOtpChanged,
    this.onCompleted,
    this.boxWidth,
    this.boxHeight,
  });

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  static const int _length = 4;
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_length, (_) => TextEditingController());
    _focusNodes = List.generate(_length, (index) {
      final node = FocusNode();
      node.addListener(() {
        if (mounted) setState(() {});
      });
      return node;
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _currentOtp => _controllers.map((c) => c.text).join();

  void _onChanged(String value, int index) {
    if (value.length > 1) {
      // Handles pasting a multi-digit code (e.g. from SMS)
      final digits = value.replaceAll(RegExp(r'\D'), '');
      for (int i = 0; i < _length; i++) {
        if (i < digits.length) {
          _controllers[i].text = digits[i];
        }
      }
      final lastIndex = (digits.length < _length ? digits.length : _length - 1);
      _focusNodes[lastIndex].requestFocus();
      widget.onOtpChanged(_currentOtp);
      if (_currentOtp.length == _length) {
        widget.onCompleted?.call(_currentOtp);
      }
      setState(() {});
      return;
    }

    if (value.isNotEmpty) {
      if (index < _length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }

    widget.onOtpChanged(_currentOtp);
    if (_currentOtp.length == _length) {
      widget.onCompleted?.call(_currentOtp);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_length, (index) {
        final isFocused = _focusNodes[index].hasFocus;
        final hasValue = _controllers[index].text.isNotEmpty;

        return Container(
          width: widget.boxWidth ?? 58.w,
          height: widget.boxHeight ?? 64.h,
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: isFocused ? AppColors.primaryBlue : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                offset: Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: KeyboardListener(
            focusNode: FocusNode(),
            onKeyEvent: (event) {
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.backspace &&
                  _controllers[index].text.isEmpty &&
                  index > 0) {
                _focusNodes[index - 1].requestFocus();
                _controllers[index - 1].clear();
                widget.onOtpChanged(_currentOtp);
                setState(() {});
              }
            },
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: AppTypography.otpDigitText,
              cursorColor: AppColors.primaryBlue,
              maxLength: 1,
              showCursor: isFocused && !hasValue,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (val) => _onChanged(val, index),
            ),
          ),
        );
      }),
    );
  }
}
