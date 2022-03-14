import 'package:url_launcher/url_launcher.dart';

lunchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw ('Could not lunch $url');
  }
}
