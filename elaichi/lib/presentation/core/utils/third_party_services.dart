import 'package:elaichi/domain/exceptions/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class ThirdPartyServices {
  Future<void> launchUrl(String url) async {
    final _url = Uri.parse(url);
    try {
      await url_launcher.launchUrl(_url);
    } catch (e) {
      throw CustomException(e, message: "couldn't launch $_url");
    }
  }
}
