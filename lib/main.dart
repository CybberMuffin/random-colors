import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_colors/ui/views/main_view/main_view.dart';
import 'models/history/color_history/color_history.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorHistory()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Test',
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}
