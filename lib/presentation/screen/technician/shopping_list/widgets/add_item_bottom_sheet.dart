import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

class CatalogProduct {
  final String title;
  final String price;

  const CatalogProduct({
    required this.title,
    required this.price,
  });
}

/// Bottom Sheet / Modal Dialog for "Add item" from the product catalog
class AddItemBottomSheet extends StatefulWidget {
  final Function(String title, String price, int quantity, bool notBilled)? onSave;

  const AddItemBottomSheet({
    super.key,
    this.onSave,
  });

  static Future<void> show(
    BuildContext context, {
    Function(String title, String price, int quantity, bool notBilled)? onSave,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddItemBottomSheet(onSave: onSave),
    );
  }

  @override
  State<AddItemBottomSheet> createState() => _AddItemBottomSheetState();
}

class _AddItemBottomSheetState extends State<AddItemBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  int _quantity = 1;
  bool _notBilled = false;
  int? _selectedIndex;

  final List<CatalogProduct> _catalogProducts = const [
    CatalogProduct(title: 'Bag of salt 40lb', price: '\$18.00'),
    CatalogProduct(title: 'Chlorine tabs', price: '\$4.00'),
    CatalogProduct(title: 'DE powder', price: '\$22.00'),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() => _quantity++);
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() => _quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      padding: EdgeInsets.fromLTRB(
        20.w,
        12.h,
        20.w,
        MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Grey Drag Handle Pill
          Center(
            child: Container(
              width: 38.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD8DFE7),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          16.verticalSpace,

          /// Title "Add item" + circular close button (X)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add item',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkNavy,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).maybePop(),
                borderRadius: BorderRadius.circular(18.r),
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F4F8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    size: 18.w,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,

          /// Search Field: "Search the product catalog"
          Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: const Color(0xFFE5E9F0)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  size: 20.w,
                  color: const Color(0xFF9AA5B5),
                ),
                10.horizontalSpace,
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.sp,
                      color: AppColors.darkNavy,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search the product catalog',
                      hintStyle: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9AA5B5),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,

          /// Product Catalog Card with Dividers
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(color: const Color(0xFFEFF2F6)),
            ),
            child: Column(
              children: List.generate(_catalogProducts.length, (index) {
                final product = _catalogProducts[index];
                final isSelected = _selectedIndex == index;

                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = isSelected ? null : index;
                        });
                      },
                      borderRadius: BorderRadius.vertical(
                        top: index == 0 ? Radius.circular(18.r) : Radius.zero,
                        bottom: index == _catalogProducts.length - 1
                            ? Radius.circular(18.r)
                            : Radius.zero,
                      ),
                      child: Container(
                        color: isSelected
                            ? AppColors.primaryBlue.withValues(alpha: 0.06)
                            : Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.title,
                              style: TextStyle(
                                fontFamily: AppTypography.poppinsFont,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkNavy,
                              ),
                            ),
                            Text(
                              product.price,
                              style: TextStyle(
                                fontFamily: AppTypography.poppinsFont,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkNavy,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (index != _catalogProducts.length - 1)
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFEFF2F6),
                      ),
                  ],
                );
              }),
            ),
          ),
          20.verticalSpace,

          /// Quantity Row: "Quantity" with [-] count [+]
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quantity',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                ),
              ),
              Row(
                children: [
                  _buildCircleButton(
                    icon: Icons.remove_rounded,
                    onTap: _decrement,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      '$_quantity',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                  ),
                  _buildCircleButton(
                    icon: Icons.add_rounded,
                    onTap: _increment,
                  ),
                ],
              ),
            ],
          ),
          16.verticalSpace,

          /// Checkbox: "Add to shopping list only (not billed)"
          GestureDetector(
            onTap: () => setState(() => _notBilled = !_notBilled),
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    color: _notBilled ? AppColors.primaryBlue : AppColors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: _notBilled ? AppColors.primaryBlue : const Color(0xFFCBD5E1),
                      width: 1.8,
                    ),
                  ),
                  child: _notBilled
                      ? Icon(
                          Icons.check_rounded,
                          size: 16.w,
                          color: AppColors.white,
                        )
                      : null,
                ),
                12.horizontalSpace,
                Text(
                  'Add to shopping list only (not billed)',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
          24.verticalSpace,

          /// Blue Primary Button: "Save"
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: () {
                final selected = _selectedIndex != null ? _catalogProducts[_selectedIndex!] : null;
                widget.onSave?.call(
                  selected?.title ?? 'Custom Item',
                  selected?.price ?? '\$0.00',
                  _quantity,
                  _notBilled,
                );
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
                'Save',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: const BoxDecoration(
          color: Color(0xFFF7FAFC),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 16.w,
            color: AppColors.darkNavy,
          ),
        ),
      ),
    );
  }
}
