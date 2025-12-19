import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scube_task/constant/colors.dart';
import 'package:scube_task/widget/source_tab.dart';

class SummaryTab extends StatefulWidget {
  const SummaryTab({super.key});

  @override
  State<SummaryTab> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  int _selectedTab = 0;
  Widget _buildContent() {
    switch (_selectedTab) {
      case 0:
        return const SourceTab();
      case 1:
        return const LoadTab();
      default:
        return const SourceTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Electricity',
          style: TextStyle(color: AppColors.textButton, fontSize: 20),
        ),
        Divider(
          color: AppColors.textButton,
        ),
        // Round border inside text
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryColor,
              width: 16,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Power',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '5.53 KW',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 8),

        // cupertino segmented
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl<int>(
                groupValue: _selectedTab,
                backgroundColor: Colors.grey.shade200,
                thumbColor: AppColors.primaryColor,
                children: {
                  0: Padding(padding: EdgeInsets.all(8),child: Text('Source',style: TextStyle(fontSize: 20),),),
                  1:Padding(padding: EdgeInsets.all(8),child: Text('Load',style: TextStyle(fontSize: 20),),),
                },
                onValueChanged: (int? value) {
                  setState(() {
                    _selectedTab = value ?? 0;
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(child: _buildContent())
      ],
    );
  }
}

class SLDTab extends StatelessWidget {
  const SLDTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('SLD');
  }
}

class DataTab extends StatelessWidget {
  const DataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Data');
  }
}
