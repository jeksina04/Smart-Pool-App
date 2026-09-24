import 'dart:async';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import '../../../../util/app_typography.dart';

/// Resend OTP code row with active countdown timer.
class ResendTimerWidget extends StatefulWidget {
  final VoidCallback onResend;

  const ResendTimerWidget({
    super.key,
    required this.onResend,
  });

  @override
  State<ResendTimerWidget> createState() => _ResendTimerWidgetState();
}

class _ResendTimerWidgetState extends State<ResendTimerWidget> {
  static const int _initialSeconds = 30;
  int _secondsLeft = _initialSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _secondsLeft = _initialSeconds;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() {
          _secondsLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final seconds = _secondsLeft.toString().padLeft(2, '0');
    return '00:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final bool canResend = _secondsLeft == 0;

    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: context.getString('dont_receive_code'),
              style: AppTypography.resendNormal,
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: canResend
                    ? () {
                        _startTimer();
                        widget.onResend();
                      }
                    : null,
                child: Text(
                  canResend
                      ? context.getString('resend_code')
                      : context.getString('resend_in', {'time': _formattedTime}),
                  style: AppTypography.resendHighlight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
