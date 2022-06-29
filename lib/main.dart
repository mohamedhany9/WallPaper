import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/database/liked_image.dart';
import 'package:wallpaper/service_api/provider.dart';
import 'package:wallpaper/views/home_page.dart';

void main() async{
  await Hive.initFlutter();

  //Hive.registerAdapter(LikedImage());
  await Hive.openBox<String>('LikedImage');

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
