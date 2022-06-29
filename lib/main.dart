import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/service_api/provider.dart';
import 'package:wallpaper/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataClass>(create: (_) => DataClass()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WallPaper',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const Homepage(),
      ),
    );
  }
}
