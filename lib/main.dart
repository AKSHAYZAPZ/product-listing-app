import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/view/splash_screen/view/splash_screen.dart';

import 'utils/color_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'zybo_test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstant.white,
        dialogBackgroundColor: ColorConstant.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      //SplashScreen(),
    );
  }
}
