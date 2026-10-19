import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/chat_input_field.dart';
import 'widgets/invoice_attachment.dart';
import 'widgets/support_profile_section.dart';

class PoolCareSupportPage extends StatelessWidget {
  final VoidCallback onBack;

  const PoolCareSupportPage({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Branding Header
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.spLogoOnboarding, width: 26.w),
                      8.horizontalSpace,
                      Image.asset(AppAssets.woodmarkOnboarding,
                          width: 90.w, fit: BoxFit.contain),
                    ],
                  ),
                  GestureDetector(
                    onTap: onBack,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.primaryBlue,
                      child: SvgPicture.asset(
                        AppAssets.icNavProfile,
                        height: 18.w,
                        width: 18.w,
                        colorFilter: const ColorFilter.mode(
                            AppColors.white, BlendMode.srcIn,),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            8.verticalSpace,

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    const SupportProfileSection(),
                    16.verticalSpace,

                    // --> Replace with real data
                    // User Message
                    const ChatBubble(
                      message:
                          "Hi, I noticed I was charged twice for my June filter replacement...",
                      isUser: true,
                      time: "10:14 AM",
                    ),
                    8.verticalSpace,

                    // Support Reply 1
                    const ChatBubble(
                      message:
                          "Hi Renee, sorry about that! Let me pull up your account and check that for you right away.",
                      isUser: false,
                    ),
                    8.verticalSpace,

                    // Support Reply 2
                    const ChatBubble(
                      message:
                          "You’re right — invoice #INV-3379 was accidentally charged twice due to a system sync error.",
                      isUser: false,
                    ),
                    12.verticalSpace,

                    // Invoice Attachment
                    const InvoiceAttachment(
                      invoiceId: "INV-3379",
                      amount: "\$65",
                      date: "Jun 24",
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Input Field
            const ChatInputField(),
          ],
        ),
      ),
    );
  }
}
