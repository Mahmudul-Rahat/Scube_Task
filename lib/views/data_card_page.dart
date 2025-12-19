import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task/constant/colors.dart';
import 'package:scube_task/widget/custom_segmented_button.dart';
import 'package:scube_task/widget/data_view_tab.dart';
import 'package:scube_task/widget/revenue_view.dart';

class DataCardPage extends StatefulWidget {
  const DataCardPage({super.key});

  @override
  State<DataCardPage> createState() => _DataCardPageState();
}

class _DataCardPageState extends State<DataCardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {context.pop();},
        ),
        centerTitle: true,
        title: const Text(
          'SCM',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: CustomSegmentedButton(
                selectedIndex: _selectedIndex,
                labels: const ['Data View', 'Revenue View'],
                onChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),

          Positioned(
            top: 90,
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildSegmentedContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedContent() {
    switch (_selectedIndex) {
      case 0:
        return  DataViewTab();
      case 1:
        return RevenueView();
      default:
        return const SizedBox();
    }
  }
}

