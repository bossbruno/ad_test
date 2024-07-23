import 'package:ad_test/BannerAdHome.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize().then((InitializationStatus status) {
    print('Initialization complete: ${status.adapterStatuses}');
    runApp(const MyApp());
  }).catchError((error) {
    print('Error initializing Mobile Ads: $error');
    // Handle the error appropriately, e.g., display a message to the user.
  });
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
