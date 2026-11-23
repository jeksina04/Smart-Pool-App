import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/check_tdlr_button.dart';
import 'widgets/download_certificate_button.dart';
import 'widgets/insurance_section_card.dart';
import 'widgets/licence_header_card.dart';
import 'widgets/licence_info_banner.dart';

class LicenceInsurancePage extends StatefulWidget {
  final String? licenceNumber;
  final String? licenceType;
  final String? companyName;
  final String? issuedBy;
  final String? expiresDate;
  final String? status;
  final String? generalLiability;
  final String? workersComp;
  final String? tdlrUrl;

  const LicenceInsurancePage({
    super.key,
    this.licenceNumber,
    this.licenceType,
    this.companyName,
    this.issuedBy,
    this.expiresDate,
    this.status,
    this.generalLiability,
    this.workersComp,
    this.tdlrUrl,
  });

  @override
  State<LicenceInsurancePage> createState() => _LicenceInsurancePageState();
}

class _LicenceInsurancePageState extends State<LicenceInsurancePage> {
  late String _licenceNumber;
  late String _licenceType;
  late String _companyName;
  late String _issuedBy;
  late String _expiresDate;
  late String _status;
  late String _generalLiability;
  late String _workersComp;
  late String _tdlrUrl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _licenceNumber = widget.licenceNumber ?? '#TX-PC-40218';
    _licenceType = widget.licenceType ?? context.getString('residential_pool_contractor');
    _companyName = widget.companyName ?? 'NSP Pool & Spa Services';
    _issuedBy = widget.issuedBy ?? 'Texas TDLR';
    _expiresDate = widget.expiresDate ?? '31 Mar 2027';
    _status = widget.status ?? context.getString('current_status');
    _generalLiability = widget.generalLiability ?? 'Hiscox · \$1,000,000 per occurrence · expires 30 Sep 2027';
    _workersComp = widget.workersComp ?? 'Texas Mutual · expires 30 Sep 2027';
    _tdlrUrl = widget.tdlrUrl ?? 'https://www.tdlr.texas.gov';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            /// Header Bar
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: SizedBox(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 36.w,
                          height: 36.w,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.cardShadow,
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10.w),
                          child: SvgPicture.asset(AppAssets.icBack),
                        ),
                      ),
                    ),
                    Text(
                      context.getString('licence_and_insurance'),
                      style: AppTypography.sectionHeader,
                    ),
                  ],
                ),
              ),
            ),
            8.verticalSpace,

            /// Body Scroll Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,

                    /// Licence Top Details Card
                    LicenceHeaderCard(
                      licenceNumber: _licenceNumber,
                      licenceType: _licenceType,
                      companyName: _companyName,
                      issuedBy: _issuedBy,
                      expiresDate: _expiresDate,
                      status: _status,
                    ),
                    16.verticalSpace,

                    /// Insurance Details Card
                    InsuranceSectionCard(
                      generalLiabilityInfo: _generalLiability,
                      workersCompInfo: _workersComp,
                    ),
                    16.verticalSpace,

                    /// Verification Info Banner
                    LicenceInfoBanner(
                      companyName: _companyName,
                    ),
                    16.verticalSpace,

                    /// External Verification TDLR Button
                    CheckTdlrButton(
                      url: _tdlrUrl,
                    ),
                    16.verticalSpace,

                    /// Download Insurance Certificate Button
                    DownloadCertificateButton(
                      onPressed: () {
                        // Action to download/view insurance PDF
                      },
                    ),
                    8.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}