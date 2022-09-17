// To be used if and when required.

// import 'package:elaichi/data/constants/app_env.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';

// class RemoteConfig {
//   factory RemoteConfig() {
//     return _service;
//   }

//   RemoteConfig._internal();
//   static final _service = RemoteConfig._internal();

//   late FirebaseRemoteConfig _remoteConfig;
//   Future<void> init() async {
//     try {
//       _remoteConfig = FirebaseRemoteConfig.instance;
//       final fetchResult = await _remoteConfig.fetchAndActivate();
//       if (!fetchResult) {
//         await _remoteConfig.setDefaults(const {
//           'zimbra_base_url': Env.webMailBaseUrl,
//           'avenue_webmail_base_url': Env.avenueWebMailBaseUrl
//         });
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   String get webMailBaseUrl => _remoteConfig.getString('zimbra_base_url');

//   String get avenueWebMailBaseUrl =>
//       _remoteConfig.getString('avenue_webmail_base_url');
// }
