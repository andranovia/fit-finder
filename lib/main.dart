import 'package:flutter/material.dart';
import 'package:fit_finder/common/color_extension.dart';
import 'package:fit_finder/view/main_tab/main_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
    
        primaryColor: TColor.primary,
        fontFamily: "Quicksand"
      ),
      home: const MainTabView(),
    );
  }
}


