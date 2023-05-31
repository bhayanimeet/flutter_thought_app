import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  AdHelper._();

  static final AdHelper adHelper = AdHelper._();

  InterstitialAd? interstitialAd;
  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/8691691433',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }
}