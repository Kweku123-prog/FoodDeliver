import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/home/food/recommended_food_detail.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Pages/home/food/Popular_food_detail.dart';
import 'Pages/home/main_food_page.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: RecommendedFodDetail() ,
    );
  }
}
