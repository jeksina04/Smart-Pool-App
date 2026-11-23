import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../service/navigation.dart';
import 'invoice_paid_card.dart';

class InvoicePaidList extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const InvoicePaidList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: InvoicePaidCard(
            invoiceNumber: item['id'] ?? '#3406',
            month: item['month'] ?? 'July',
            paidDate: item['paidDate'] ?? '2 Jul',
            paymentMethod: item['paymentMethod'] ?? 'Visa •••• 6411',
            lineItemSummary: item['summary'] ?? 'Weekly cleaning · \$135.00',
            amountPaid: item['amount'] ?? '\$135',
            onReceiptTap: () {
              Navigator.pushNamed(
                context,
                Routes.invoiceDetail,
                arguments: item,
              );
            },
          ),
        );
      }),
    );
  }
}