import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task/constant/colors.dart';
import 'package:scube_task/constant/image.dart';
import 'package:scube_task/widget/secondary_button.dart';
import 'package:scube_task/widget/summary_tab.dart';


class CupertinoSegmanted extends StatefulWidget {
  const CupertinoSegmanted({super.key});

  @override
  State<CupertinoSegmanted> createState() => _CupertinoSegmantedState();
}

class _CupertinoSegmantedState extends State<CupertinoSegmanted> {
  int _selectedTab = 0;
  Widget _buildContent() {
    switch (_selectedTab) {
      case 0:
        return const SummaryTab();
      case 1:
        return const SLDTab();
      case 2:
        return const DataTab();
      default:
        return const SummaryTab();
    }
  }


  @override
  Widget build(BuildContext context) {
    final List<ButtonItem> buttons = [
      ButtonItem(
        title: 'Analysis pro',
        iconPath: AppImage.graph,
        onTap: () {context.push('/no-data');},
      ),
      ButtonItem(
        title: 'G.Generator',
        iconPath: AppImage.generator,
        onTap: () {context.push('/no-data');},
      ),
      ButtonItem(
        title: 'Plant Summary',
        iconPath: AppImage.current,
        onTap: () {context.push('/no-data');},
      ),
      ButtonItem(
        title: 'Natural Gas',
        iconPath: AppImage.fire,
        onTap: () {context.push('/no-data');},
      ),
      ButtonItem(
        title: 'D.Generator',
        iconPath: AppImage.generator,
        onTap: () {context.push('/no-data');},
      ),
      ButtonItem(
        title: 'Water Process',
        iconPath: AppImage.water,
        onTap: () {context.push('/no-data');},
      ),
    ];
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFD9E4F1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'SCM',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
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

        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.7,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl<int>(
                        groupValue: _selectedTab,
                        backgroundColor: Colors.white,
                        thumbColor: AppColors.primaryColor,
                        children: {
                          0: Padding(padding: EdgeInsets.all(8),child: Text('Summary',style: TextStyle(fontSize: 20),),),
                          1:Padding(padding: EdgeInsets.all(8),child: Text('Sld',style: TextStyle(fontSize: 20),),),
                          2:Padding(padding: EdgeInsets.all(8),child: Text('Data',style: TextStyle(fontSize: 20),),),
                        },
                        onValueChanged: (int? newValue){
                          setState(() {
                            _selectedTab = newValue ?? 0;
                          });
                        },
                      ),
                    ),
                    Divider(),
                    Expanded(child: _buildContent()),
                  ],
                ),
              ),
              SizedBox(height: 20,),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.6,
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                final item = buttons[index];

                return IconElevatedButton(
                  text: item.title,
                  imagePath: item.iconPath,
                  onPressed: item.onTap,
                );
              },
            )

            ],
          ),
                ),
        )
    );
  }
}
