import 'package:connectivity/connectivity.dart';

isOnline() async {
  ConnectivityResult result = await Connectivity().checkConnectivity();

  return (result == ConnectivityResult.mobile ||
      result == ConnectivityResult.wifi);
}
