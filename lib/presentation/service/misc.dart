import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MiscService {
  void getFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  void revertFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  Future<PackageInfo> getPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }

  void shareApp(String text) {
    Share.share(text);
  }

  void rateApp() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  /*By default, Android opens up a browser when handling URLs.
  You can pass forceWebView: true parameter to tell the plugin to open a WebView instead.
  On iOS, the default behavior is to open all web URLs within the app.
  Everything else is redirected to the app handler.*/
  void openBrowser(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not open the browser.';
    }
  }

  openMail(String to, {String subject = "", String body = ""}) async {
    final mailUri = Uri.parse("mailto:$to?subject=$subject&body=$body");
    if (await canLaunchUrl(mailUri)) {
      await launchUrl(mailUri);
    } else {
      throw 'Could not open the mail client.';
    }
  }

  openPhoneDial(String number) async {
    final phoneUri = Uri.parse("tel:$number");
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not open the phone dial';
    }
  }
}
