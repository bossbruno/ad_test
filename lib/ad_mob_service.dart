import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
class AdMobService{
  static String get bannerAdUnitId{
    if(Platform.isAndroid){
      return'ca-app-pub-1041515975395910/8402336562';
    } else if (Platform.isIOS){
      return'ca-app-pub-1041515975395910/8832237475';
    }else{
      throw UnsupportedError('Unknown Platform');
    }
  }



}