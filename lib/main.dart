import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task/views/cupertino_segmanted.dart';
import 'package:scube_task/views/data_card_page.dart';
import 'package:scube_task/views/login_page.dart';
import 'package:scube_task/views/no_data_page.dart';
import 'package:scube_task/widget/custom_segmented_button.dart';
import 'package:scube_task/widget/data_card.dart';
import 'package:scube_task/widget/revenue_view.dart';



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:scube_task/views/login_page.dart';
import 'package:scube_task/views/data_card_page.dart';
import 'package:scube_task/views/no_data_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: '/data',
      builder: (context, state) => const DataCardPage(),
    ),

    GoRoute(
      path: '/no-data',
      builder: (context, state) => const NoDataPage(),
    ),

    GoRoute(
      path: '/CupertinoSegmanted',
      builder: (context, state) => const CupertinoSegmanted(),
    ),
  ],
);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: appRouter, // 👈 GoRouter connected here
      ),
    );
  }
}


