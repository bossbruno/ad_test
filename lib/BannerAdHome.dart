import 'package:ad_test/ad_mob_service.dart';
import 'package:flutter/material.dart';
import'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdHome extends StatefulWidget {
  const BannerAdHome({super.key});

  @override
  State<BannerAdHome> createState() => _BannerAdHomeState();
}

class _BannerAdHomeState extends State<BannerAdHome> {
  BannerAd? _bannerAd;

  // Initialize the BannerAd instance outside initState for better readability
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdMobService.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print('Failed to load banner ad: ${error.message}');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose(); // Dispose the banner ad when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Ad'), // Fix typo in title
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Center(
              child: Text('Content Above Banner Ad'), // More descriptive text
            ),
            if (_bannerAd != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
          ],
        ),
      ),);
  }
}