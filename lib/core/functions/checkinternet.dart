import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternet() async {
  try {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    }
  } catch (e) {
    print("Error checking internet connectivity: $e");
    return false;
  }
  return false;
}
