import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_colors.dart';
import 'widgets/photo_viewer_header.dart';
import 'widgets/photo_viewer_footer.dart';
import 'widgets/photo_display_card.dart';

class PhotoViewerPage extends StatefulWidget {
  final List<Map<String, dynamic>> photos;
  final int initialIndex;

  const PhotoViewerPage({
    super.key,
    required this.photos,
    this.initialIndex = 0,
  });

  @override
  State<PhotoViewerPage> createState() => _PhotoViewerPageState();
}

class _PhotoViewerPageState extends State<PhotoViewerPage> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.photoViewerBg,
      body: SafeArea(
        child: Column(
          children: [
            PhotoViewerHeader(
              currentIndex: _currentIndex + 1,
              totalPhotos: widget.photos.length,
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemCount: widget.photos.length,
                itemBuilder: (context, index) {
                  return PhotoDisplayCard(
                    photoData: widget.photos[index],
                  );
                },
              ),
            ),
            PhotoViewerFooter(
              photoData: widget.photos[_currentIndex],
              onPrev: _currentIndex > 0
                  ? () => _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)
                  : null,
              onNext: _currentIndex < widget.photos.length - 1
                  ? () => _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)
                  : null,
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
