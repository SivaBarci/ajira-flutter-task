import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternet() async {
  final connectivityResults = await Connectivity().checkConnectivity();
  return connectivityResults.contains(ConnectivityResult.mobile) ||
      connectivityResults.contains(ConnectivityResult.wifi) ||
      connectivityResults.contains(ConnectivityResult.ethernet);
}
