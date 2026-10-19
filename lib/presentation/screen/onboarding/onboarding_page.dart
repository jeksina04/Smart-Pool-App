import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/domain/model/onboarding_item.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:get_it/get_it.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'bloc/onboarding_bloc.dart';
import 'bloc/onboarding_event.dart';
import 'bloc/onboarding_state.dart';
import 'widgets/onboarding_content_widget.dart';
import 'widgets/page_indicator_widget.dart';
import 'widgets/primary_shadow_button.dart';

/// Onboarding screen with 3 slides, BLoC-driven navigation, and clean architecture.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;
  final NavigationService _navigation = GetIt.I<NavigationService>();

  static const List<OnboardingItem> _items = [
    OnboardingItem(
      logoAsset: AppAssets.spLogoOnboarding,
      woodmarkAsset: AppAssets.woodmarkOnboarding,
      subtitleKey: 'onboarding_subtitle_1',
    ),
    OnboardingItem(
      titleKey: 'onboarding_title_2',
      subtitleKey: 'onboarding_subtitle_2',
    ),
    OnboardingItem(
      titleKey: 'onboarding_title_3',
      subtitleKey: 'onboarding_subtitle_3',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) {
    if (_pageController.hasClients &&
        _pageController.page?.round() != index) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(totalPages: _items.length),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompletedState) {
            _navigation.pushReplacement(Routes.login);
          } else if (state is OnboardingPageUpdateState) {
            _animateToPage(state.pageIndex);
          }
        },
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();

          final int currentIndex = switch (state) {
            OnboardingPageUpdateState(pageIndex: final i) => i,
            OnboardingInitialState(pageIndex: final i) => i,
            _ => 0,
          };

          final bool isLastPage = switch (state) {
            OnboardingPageUpdateState(isLastPage: final l) => l,
            _ => false,
          };

          final String buttonLabel = isLastPage
              ? context.getString('get_started')
              : context.getString('next');

          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.onboardingBackgroundGradient,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // ── Top Bar ──────────────────────────────────────────
                    Padding(
                      padding: EdgeInsets.only(top: 12.h, right: 24.w, left: 24.w),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => bloc.add(OnboardingSkipPressedEvent()),
                          child: Text(
                            context.getString('skip'),
                            style: AppTypography.skipButton,
                          ),
                        ),
                      ),
                    ),

                    // ── Slide Content ─────────────────────────────────────
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _items.length,
                        onPageChanged: (index) {
                          bloc.add(OnboardingPageChangedEvent(index));
                        },
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return OnboardingContentWidget(
                            title: item.titleKey != null
                                ? context.getString(item.titleKey!)
                                : null,
                            logoAsset: item.logoAsset,
                            woodmarkAsset: item.woodmarkAsset,
                            subtitleText: context.getString(item.subtitleKey),
                          );
                        },
                      ),
                    ),

                    // ── Next / Get Started Button ─────────────────────────
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: PrimaryShadowButton(
                        text: buttonLabel,
                        onTap: () => bloc.add(OnboardingNextPressedEvent()),
                      ),
                    ),
                    24.verticalSpace,

                    // ── Page Indicators ───────────────────────────────────
                    PageIndicatorWidget(
                      itemCount: _items.length,
                      currentIndex: currentIndex,
                    ),
                    32.verticalSpace,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
