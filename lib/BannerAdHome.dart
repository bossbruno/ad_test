import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ad_test/ad_mob_service.dart';
import 'package:ad_test/main.dart';

    class BannerAdHome extends StatefulWidget{
  const BannerAdHome({super.key});

  @override
      State<BannerAdHome> createState()=> _BannerAdHomeState();

    }
    class _BannerAdHomeState extends State<BannerAdHome>{
  BannerAd? _bannerAd;
  @override
  void initState(){
    super.initState();
    BannerAd(size: AdSize.banner, adUnitId: AdMobService.bannerAdUnitId, listener: BannerAdListener(
      onAdLoaded: (ad){
        setState(() {
          _bannerAd = ad as BannerAd;
        });
      },
      onAdFailedToLoad: (ad,error){
        print('Failed to load: ${error.message}');
        ad.dispose();

      }
    ), request: AdRequest()).load();

  }


  @override
      Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Addd'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Center(
              child: Text('Bammer Ad'
              ),
            ),
            if(_bannerAd!=null)
              Align(alignment: Alignment.bottomCenter,
              child:SizedBox(
                height:_bannerAd!.size.height.toDouble(),
                width: _bannerAd!.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd!),

              )

              )
          ],
        ),
      ),
    );
  }
    }