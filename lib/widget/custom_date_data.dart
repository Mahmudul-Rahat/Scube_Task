import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scube_task/constant/colors.dart';
import 'package:scube_task/widget/today_data_tab.dart';

final fromDateProvider = StateProvider<DateTime?>((ref) => null);
final toDateProvider = StateProvider<DateTime?>((ref) => null);

class CustomDataTab extends ConsumerWidget {
  const CustomDataTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromDate = ref.watch(fromDateProvider);
    final toDate = ref.watch(toDateProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          //From date to date and search button in a row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // From Date Button
                Flexible(
                  fit: FlexFit.tight,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // reduced radius
                      ),
                    ),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: fromDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        ref.read(fromDateProvider.notifier).state = picked;
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(fromDate != null
                            ? " ${fromDate.day}/${fromDate.month}/${fromDate.year}"
                            : "From Date"),
                        Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // To Date Button
                Flexible(
                  fit: FlexFit.tight,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: toDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        ref.read(toDateProvider.notifier).state = picked;
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(toDate != null
                            ? " ${toDate.day}/${toDate.month}/${toDate.year}"
                            : "To Date"),
                        Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Search Button
                OutlinedButton(
                  onPressed: () {
                    debugPrint("Search from $fromDate to $toDate");
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),

          TodayDataTab(),

          TodayDataTab()

        ],
      ),
    );
  }
}
