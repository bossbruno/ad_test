import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ad_test/ad_mob_service.dart';
import 'package:ad_test/BannerAdHome.dart';


void main (){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BannerAdHome(),
    );
  }
}






