import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CheckTdlrButton extends StatelessWidget {
  final String url;

  const CheckTdlrButton({
    super.key,
    required this.url,
  });

  Future<void> _launchUrl() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: _launchUrl,
        borderRadius: BorderRadius.circular(28.r),
        child: Center(
          child: Text(
            context.getString('check_on_tdlr'),
            style: AppTypography.logOut,
          ),
        ),
      ),
    );
  }
}