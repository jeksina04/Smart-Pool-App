import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/add_item_bottom_sheet.dart';
import 'widgets/shopping_item_row.dart';
import 'widgets/shopping_list_header_bar.dart';

/// Screen: "Items needed / Shopping List"
class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<ShoppingItemModel> _items = [
    const ShoppingItemModel(
      id: '1',
      title: 'Bag of salt 40lb',
      price: '\$18.00',
      isInstalled: false,
    ),
    const ShoppingItemModel(
      id: '2',
      title: 'Chlorine tabs ×3',
      price: '\$12.00',
      isInstalled: false,
    ),
    const ShoppingItemModel(
      id: '3',
      title: 'Actuator GLD-30',
      price: '\$46.00',
      isInstalled: true,
    ),
  ];

  void _toggleItem(int index, bool newValue) {
    setState(() {
      _items[index] = _items[index].copyWith(isInstalled: newValue);
    });
  }

  void _showAddItemDialog() {
    AddItemBottomSheet.show(
      context,
      onSave: (title, price, quantity, notBilled) {
        setState(() {
          final displayTitle = quantity > 1 ? '$title ×$quantity' : title;
          _items.add(
            ShoppingItemModel(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: displayTitle,
              price: price,
              isInstalled: false,
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with back button, title, and + button
            ShoppingListHeaderBar(
              onBack: () => Navigator.of(context).maybePop(),
              onAdd: _showAddItemDialog,
            ),

            /// Scrollable Body Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Explanation hint row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Mark an item installed and it joins this visit\'s bill.',
                            style: TextStyle(
                              fontFamily: AppTypography.poppinsFont,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGrey,
                              height: 1.35,
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.chevron_right_rounded,
                                size: 14.w,
                                color: const Color(0xFF9AA5B5),
                              ),
                              2.horizontalSpace,
                              Text(
                                'swipe or\ntap',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: AppTypography.poppinsFont,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textGrey,
                                  height: 1.15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    16.verticalSpace,

                    /// Billable items card container
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x08102A50),
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: List.generate(_items.length, (index) {
                          final item = _items[index];
                          return Column(
                            children: [
                              ShoppingItemRow(
                                item: item,
                                onToggle: (val) => _toggleItem(index, val),
                              ),
                              if (index != _items.length - 1)
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Color(0xFFF0F3F6),
                                ),
                            ],
                          );
                        }),
                      ),
                    ),
                    24.verticalSpace,

                    /// Section Title: "Notes (non-billable)"
                    Text(
                      'Notes (non-billable)',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    12.verticalSpace,

                    /// Non-billable Note Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x08102A50),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 38.w,
                            height: 38.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE9F1FE),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.build_outlined,
                                size: 18.w,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                          14.horizontalSpace,
                          Expanded(
                            child: Text(
                              'Check pump seal next visit',
                              style: TextStyle(
                                fontFamily: AppTypography.poppinsFont,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkNavy,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    14.verticalSpace,

                    /// Read-only price note pill banner
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBF2FD),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock_outline_rounded,
                            size: 15.w,
                            color: const Color(0xFF1B6BD8),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              'Prices are set by the owner and read-only for technicians.',
                              style: TextStyle(
                                fontFamily: AppTypography.poppinsFont,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1B6BD8),
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    32.verticalSpace,

                    /// Bottom "+ Add Item" pill button
                    _buildAddItemButton(),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddItemButton() {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _showAddItemDialog,
          borderRadius: BorderRadius.circular(26.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_rounded,
                size: 20.w,
                color: AppColors.darkNavy,
              ),
              8.horizontalSpace,
              Text(
                'Add Item',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
