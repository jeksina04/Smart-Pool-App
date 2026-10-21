import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../service/navigation.dart';
import 'invoice_item_tile.dart';

class InvoiceList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const InvoiceList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 8.r,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          children: List.generate(items.length, (index) {
            final item = items[index];
            return Column(
              children: [
                InvoiceItemTile(
                  invoiceNo: '${item['id']} · ${item['month']}',
                  description: item['desc'] as String,
                  price: item['amount'] as String,
                  isDue: item['isDue'] as bool,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.invoiceDetail, arguments: item);
                  },
                ),
                if (index != items.length - 1)
                  const Divider(
                    height: 1,
                    color: AppColors.dividerColor,
                  ),
              ],
            );
          }),
        ));
  }
}
